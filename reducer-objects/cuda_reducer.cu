#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>
#include <cudaReduce.hpp>

#define N 1000

/* Summary: reduction for 1mil unsigned values
 * by custom CUDA implementation. Checksum: 499495.
 * Runtime values from gpu_a100 JLSE machine. 
 * Approx. runtimes: Total: 76-82ms. Mem alloc: 76-82ms.
 * Reduction: 0.02ms. 
 */

__global__ void reduce_GPU(bar::AtomicReduction<unsigned> *d) {

    /* shared memory */
    extern __shared__ bar::AtomicScalar<unsigned> sdata[];
    unsigned tid = threadIdx.x;
    unsigned i = blockIdx.x*blockDim.x + threadIdx.x;

    /* load into shared memory */
    sdata[tid] = d[0][i];


    /* reduction */
    for (unsigned s=1; s < blockDim.x; s *= 2) {
        if (tid % (2*s) == 0) {
            sdata[tid] += sdata[tid + s];
	}
	__syncthreads();
    }

    if (tid==0) d[0][0] = sdata[0];
}

void dense(unsigned* h) {

    srand(0);
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

/* CPU timing functions */
int main(int argc, char **argv) {

    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    /* initialize reducer on device */
    unsigned* h;
    h = (unsigned *)malloc(N*sizeof(unsigned));
    dense(h);

    bar::AtomicReduction<unsigned>arr_h(h);
    bar::AtomicReduction<unsigned> *d;
    cudaMallocManaged(&d, sizeof(arr_h));
    *d = arr_h;

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);

reduce_GPU<<<(N+1023) / 1024, 1024>>>(d);

    /* Stop Clock */
    gettimeofday(&etstop, &tzdummy);
    etstop2 = times(&cputstop);
    printf("Stopped clock.\n");
    usecstart = (unsigned long long)etstart.tv_sec * 1000000 + etstart.tv_usec;
    usecstop = (unsigned long long)etstop.tv_sec * 1000000 + etstop.tv_usec;
    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);


    printf("Checksum: ");
    d[0][0].dispScalar();

    exit(0);
}
