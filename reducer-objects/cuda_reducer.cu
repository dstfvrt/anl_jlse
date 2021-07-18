#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>

#define N 1000000

__global__ void reduce_GPU(unsigned *d) {
    d[0] += 1;
    printf("tid: %u", threadIdx.x);
}

int main(int argc, char **argv) {

    unsigned* h;
    cudaMallocManaged(&h, N*sizeof(unsigned));

    /* to kernel */
    reduce_GPU<<<1, 1, 1000>>>(h);
    cudaDeviceSynchronize();
    printf("Checksum: %u\n", h[0]);
    exit(0);
}
