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

__global__ void reduce_GPU(void *d) {

    bar::AtomicReduction<unsigned>arr_d(d);
    unsigned tid = threadIdx.x;
    unsigned i = blockIdx.x*blockDim.x + threadIdx.x;

    /* reduction */
    for (unsigned s=1; s < blockDim.x; s *= 2) {
        if (tid % (2*s) == 0) {
            arr_d[tid] += arr_d[tid + s];
	}
	__syncthreads();
    }
}

void dense(unsigned* h) {

    srand(0);
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

int main(int argc, char **argv) {

    /* initialize reducer on device */
    void* h;
    cudaMallocManaged(&h, N*sizeof(unsigned);

    dense(h);

    /* to kernel */
reduce_GPU<<<(N+1023) / 1024, 1024>>>(h);

    printf("checksum %u", h[0]);
    exit(0);
}
