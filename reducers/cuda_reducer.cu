#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 1000000

__global__ void reduce_GPU(unsigned* d) {

    const int tid = threadIdx.x;
    int step_size = 1;
    int thread_count = blockDim.x;

    while (thread_count > 0) {

        if (tid < thread_count) {
         
	    int l_ind = tid * step_size * 2;
	    int r_ind = l_ind + step_size;
	    d[l_ind] += d[r_ind];
        }

	step_size <<= 1;
	thread_count >>=1;
    }
}

void dense(unsigned* h) {

    srand((unsigned)time(NULL));
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

int main(int argc, char **argv) {
    unsigned* h; 
    unsigned* d;
    int nBytes;
    nBytes = N*sizeof(unsigned);

    h = (unsigned *)malloc(nBytes);
    dense(h);

    cudaMalloc(&d, sizeof(unsigned));
    cudaMemcpy(d, h, sizeof(unsigned), cudaMemcpyHostToDevice);
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    printf("\n------------------------------\n");
    printf("\nStarting clock.\n");

    cudaEventRecord(start);
    reduce_GPU<<<1, N / 2>>>(d);
    cudaEventRecord(stop);
    printf("\nStopping clock.\n");

    cudaEventSynchronize(stop);

    float elapsed;
    cudaEventElapsedTime(&elapsed, start, stop);
    cudaEventDestroy(start);
    cudaEventDestroy(stop);

    int result;
    cudaMemcpy(&result, d, nBytes, cudaMemcpyDeviceToHost);
    printf("\nElapsed time: %f ms", elapsed);
    printf("\nsum: %d\n", result);

    exit(0);
}
