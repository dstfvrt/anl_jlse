#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <cuda_profiler_api.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

__inline__ __device__
unsigned warpReduceRedux(unsigned val) {
    return __nvvm_redux_sync_add(val, 0xFF);
}

__global__ void reduceKernel(unsigned *in, unsigned* out, int N) {
    unsigned sum = in[threadIdx.x];
    sum = warpReduceRedux(sum);
    if (threadIdx.x == 0)
        out[0] = sum;
}

int main()
{
    const int SIZE = 32;
    const int ARRAY_BYTES = SIZE * sizeof(unsigned);

    // generate the input array on the host
    unsigned h_in[SIZE];
    unsigned sum = 0.0f;
    for (int i = 0; i < SIZE; i++) {
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
    reduceKernel<<<1, SIZE>>>(d_in, d_out, SIZE);

    // copy back the sum from GPU
    unsigned h_out;
    cudaMemcpy(&h_out, d_out, sizeof(unsigned), cudaMemcpyDeviceToHost);
    printf("%u\n", h_out);
}
