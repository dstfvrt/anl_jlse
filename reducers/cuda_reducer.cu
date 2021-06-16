#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>


#define N 1000

/* Summary: reduction for 1mil unsigned values
 * by custom CUDA implementation. Checksum: 499495.
 * Runtime values from gpu_a100 JLSE machine. 
 * Approx. runtimes: Total: 76-82ms. Mem alloc: 76-82ms.
 * Reduction: 0.02ms. 
 */

__global__ void reduce_GPU(unsigned* d) {
    /* Shared memory */
    extern __shared__ unsigned sdata[];

    /* load into shared memory */
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;
    sdata[tid] = d[i];
    __syncthreads();

    /* reduction */
    for (unsigned s=1; s < blockDim.x; s *= 2) {
        if (tid % (2*s) == 0) {
            sdata[tid] += sdata[tid + s];
	}
	__syncthreads();
    }

    if (tid==0) d[0] = sdata[0];
}

void dense(unsigned* h) {

    srand(0);
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

/* CPU timing functions */
int main(int argc, char **argv) {

    unsigned* h;
    unsigned* d;
    unsigned* result;
    unsigned nBytes;
    nBytes = N*sizeof(unsigned);

    h = (unsigned *)malloc(nBytes);
    result = (unsigned *)malloc(nBytes);
    dense(h);

    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    cudaMalloc(&d, nBytes);
    cudaMemcpy(d, h, nBytes, cudaMemcpyHostToDevice);

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);

    reduce_GPU<<<(N+1023) / 1024, 1024, nBytes>>>(d);

    /* Stop Clock */
    gettimeofday(&etstop, &tzdummy);
    etstop2 = times(&cputstop);
    printf("Stopped clock.\n");
    usecstart = (unsigned long long)etstart.tv_sec * 1000000 + etstart.tv_usec;
    usecstop = (unsigned long long)etstop.tv_sec * 1000000 + etstop.tv_usec;
    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);

    cudaMemcpy(result, d, nBytes, cudaMemcpyDeviceToHost);
    printf("Checksum: %u\n", result[0]);

    exit(0);
}
