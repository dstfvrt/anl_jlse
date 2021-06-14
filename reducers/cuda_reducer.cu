#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>

#define N 1000000

/* Summary: reduction for 1mil unsigned values
 * by custom CUDA implementation.
 * Checksum: 383
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
    for (unsigned int s=1; s < blockDim.x; s *= 2) {
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
    unsigned result;
    unsigned nBytes;
    nBytes = N*sizeof(unsigned);

    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    h = (unsigned *)malloc(nBytes);
    dense(h);

    cudaMalloc(&d, nBytes);
    cudaMemcpy(d, h, nBytes, cudaMemcpyHostToDevice);

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);

    reduce_GPU<<<1, N / 2>>>(d);

    /* Stop Clock */
    gettimeofday(&etstop, &tzdummy);
    etstop2 = times(&cputstop);
    printf("Stopped clock.\n");
    usecstart = (unsigned long long)etstart.tv_sec * 1000000 + etstart.tv_usec;
    usecstop = (unsigned long long)etstop.tv_sec * 1000000 + etstop.tv_usec;

    cudaMemcpy(&result, d, sizeof(unsigned), cudaMemcpyDeviceToHost);
    printf("Checksum: %u\n", result);

    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);

    exit(0);
}


/* CUDA timing functions
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
*/
