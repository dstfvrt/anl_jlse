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

__global__ void reduce_GPU(unsigned *d) {
    bar::AtomicReduction<unsigned>arr_d(d);
    arr_d[0] += 1;
}

int main(int argc, char **argv) {

    unsigned* h;
    cudaMallocManaged(&h, N*sizeof(unsigned));

    /* to kernel */
    reduce_GPU<<<1, N>>>(h);
    cudaDeviceSynchronize();
    printf("Checksum: %u\n", h[0]);
    exit(0);
}
