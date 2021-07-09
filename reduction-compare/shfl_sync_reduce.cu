#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <cuda_profiler_api.h>
#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

__inline__ __device__
float warpReduceRedux(float val) {
    for (int offset = 16; offset > 0; offset /= 2)
        val += __shfl_down(val, offset);
    return val;
}

__inline__ __device__
float blockReduceRedux(float val) {
    static __shared__ int shared[32];
    int lane = threadIdx.x%32;
    int wid = threadIdx.x / 32;
    val = warpReduceRedux(val);

    if (lane == 0) shared[wid] = val;
    __syncthreads();

    val = (threadIdx.x<blockDim.x / 32) ? shared[lane] : int(0);
    if (wid == 0) val = warpReduceRedux(val);

    return val;
}

__global__ void device_redux_sync_kernel(float *in, float* out, int N) {
    float sum = int(0);
    for (int i = blockIdx.x*blockDim.x + threadIdx.x; i<N; i += blockDim.x*gridDim.x) {
        sum += in[i];
    }
    sum = blockReduceRedux(sum);
    if (threadIdx.x == 0)
        out[blockIdx.x] = sum;
}

void device_reduce_redux_sync(float *in, float* out, int N) {
    const int maxThreadsPerBlock = 1024;
    int threads = maxThreadsPerBlock;
    int blocks = N / maxThreadsPerBlock;
    // Begin device execution -- reduce to 1 value per block
    device_redux_sync_kernel<<<blocks, threads >>>(in, out, N);
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess)
        printf("Error: %s\n", cudaGetErrorString(err));

    // Begin device execution -- reduce across blocks to scalar
    device_redux_sync_kernel<<<1, 1024 >>>(out, out, blocks);
    if (err != cudaSuccess)
        printf("Error: %s\n", cudaGetErrorString(err));
}

__inline__ __device__
float warpReduceShfl(float val) {
    for (int offset = 16; offset > 0; offset /= 2)
        val += __shfl_down(val, offset);
    return val;
}

__inline__ __device__
float blockReduceShfl(float val) {
    static __shared__ int shared[32];
    int lane = threadIdx.x%32;
    int wid = threadIdx.x / 32;
    val = warpReduceShfl(val);

    if (lane == 0) shared[wid] = val;
    __syncthreads();

    val = (threadIdx.x<blockDim.x / 32) ? shared[lane] : int(0);
    if (wid == 0) val = warpReduceShfl(val);

    return val;
}

__global__ void device_shfl_down_kernel(float *in, float* out, int N) {
    float sum = int(0);
    for (int i = blockIdx.x*blockDim.x + threadIdx.x; i<N; i += blockDim.x*gridDim.x) {
        sum += in[i];
    }
    sum = blockReduceShfl(sum);
    if (threadIdx.x == 0)
        out[blockIdx.x] = sum;
}

void device_reduce_shfl_down(float *in, float* out, int N) {
    const int maxThreadsPerBlock = 1024;
    int threads = maxThreadsPerBlock;
    int blocks = N / maxThreadsPerBlock;
    // Begin device execution -- reduce to 1 value per block
    device_shfl_down_kernel<<<blocks, threads >>>(in, out, N);
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess)
        printf("Error: %s\n", cudaGetErrorString(err));

    // Begin device execution -- reduce across blocks to scalar
    device_shfl_down_kernel<<<1, 1024 >>>(out, out, blocks);
    if (err != cudaSuccess)
        printf("Error: %s\n", cudaGetErrorString(err));
}


int main()
{
    const int ARRAY_SIZE = 2048;
    const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);

    // generate the input array on the host
    float h_in[ARRAY_SIZE];
    float sum = 0.0f;
    for (int i = 0; i < ARRAY_SIZE; i++) {
        // generate random float in [-1.0f, 1.0f]
        h_in[i] = i;
        sum += h_in[i];
    }

    // declare GPU memory pointers
    float * d_in, *d_intermediate, *d_out;

    // allocate GPU memory
    cudaMalloc((void **)&d_in, ARRAY_BYTES);
    cudaMalloc((void **)&d_intermediate, ARRAY_BYTES); // overallocated
    cudaMalloc((void **)&d_out, sizeof(float));

    // transfer the input array to the GPU
    cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);

    int whichKernel = 2;

    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    // launch the kernel
    cudaProfilerStart();
    switch (whichKernel) {
    case 1:
        printf("Running reduce with shuffle instruction\n");
        cudaEventRecord(start, 0);
            device_reduce_stable(d_in, d_out, ARRAY_SIZE);
        cudaEventRecord(stop, 0);
        break;
    case 2:
        printf("Running reduce with redux instruction\n");
        cudaEventRecord(start, 0);
            device_reduce_stable(d_in, d_out, ARRAY_SIZE);
        cudaEventRecord(stop, 0);
        break;
    default:
        fprintf(stderr, "error: ran no kernel\n");
        exit(EXIT_FAILURE);
    }
    cudaProfilerStop();
    cudaEventSynchronize(stop);
    float elapsedTime;
    cudaEventElapsedTime(&elapsedTime, start, stop);
    elapsedTime /= 100.0f;      // 100 trials

    // copy back the sum from GPU
    float h_out;
    cudaMemcpy(&h_out, d_out, sizeof(float), cudaMemcpyDeviceToHost);
