#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <cuda_profiler_api.h>
#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

#define REDUX_REDUCE false

// Reduction by warp using shfl.sync

__inline__ __device__
unsigned warpReduceRedux(unsigned val) {
    int laneId = threadIdx.x & 0x1f;
    unsigned reduce_element;
    unsigned remote_element;
    if (laneId == 0)
        reduce_element = val;

    remote_element = __shfl_sync(0xff, reduce_element, 0, 0x1f);
    asm volatile ("redux.sync.u32.add %0, %1, 0xff;" :
                 "+r"(remote_element) : "r"(reduce_element));

    return remote_element;
}

__inline__ __device__
unsigned warpReduceShfl(unsigned val) {
    for (int offset = 16; offset > 0; offset /= 2)
        val += __shfl_down_sync(0xff, val, offset);
    return val;
}

__inline__ __device__
unsigned blockReduce(unsigned val) {
    static __shared__ int shared[32];
    int lane = threadIdx.x%32;
    int wid = threadIdx.x / 32;
    val = warpReduceShfl(val);

    if (lane == 0)
        shared[wid] = val;
    __syncthreads();

    val = (threadIdx.x<blockDim.x / 32) ? shared[lane] : int(0);
    if (wid == 0)
        val = REDUX_REDUCE ? warpReduceRedux(val) : warpReduceShfl(val);

    return val;
}

__global__ void reduceKernel(unsigned *in, unsigned* out, int N) {
    unsigned sum = in[threadIdx.x];
    sum = warpReduceShfl(sum);
    if (threadIdx.x == 0)
        out[blockIdx.x] = sum;
}

void deviceReduce(unsigned *in, unsigned* out, int N) {
    const int maxThreadsPerBlock = 1024;
    int threads = maxThreadsPerBlock;
    int blocks = N / maxThreadsPerBlock;
    // Begin device execution
    reduceKernel<<<blocks, threads>>>(in, out, N);
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess)
        printf("Error: %s\n", cudaGetErrorString(err));
}


int main()
{
    const int ARRAY_SIZE = 1024;
    const int ARRAY_BYTES = ARRAY_SIZE * sizeof(unsigned);

    // generate the input array on the host
    unsigned h_in[ARRAY_SIZE];
    unsigned sum = 0.0f;
    for (int i = 0; i < ARRAY_SIZE; i++) {
        h_in[i] = i;
        sum += h_in[i];
    }

    // declare GPU memory pointers
    unsigned * d_in, *d_out;

    // allocate GPU memory
    cudaMalloc((void **)&d_in, ARRAY_BYTES);
    cudaMalloc((void **)&d_out, sizeof(unsigned));

    // transfer the input array to the GPU
    cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);

    // offload to device
    deviceReduce(d_in, d_out, ARRAY_SIZE);

    // copy back the sum from GPU
    unsigned h_out;
    cudaMemcpy(&h_out, d_out, sizeof(unsigned), cudaMemcpyDeviceToHost);
    printf("%u\n", h_out);
}
