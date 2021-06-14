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

/* CPU timing functions */
int main(int argc, char **argv) {

    unsigned* h;
    unsigned result = 0;
    int nBytes;
    nBytes = N*sizeof(unsigned);

    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    h = (unsigned *)malloc(nBytes);
    dense(h);

    cudaMalloc(&d, sizeof(unsigned));
    cudaMemcpy(d, h, sizeof(unsigned), cudaMemcpyHostToDevice);

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

    int result;
    cudaMemcpy(&result, d, nBytes, cudaMemcpyDeviceToHost);
    printf("Checksum: %u\n", result);

    /* Display timing results */
    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);

    printf("(CPU times are accurate to the nearest %g ms)\n",
           1.0/(float)CLOCKS_PER_SEC * 1000.0);
    printf("My total CPU time for parent = %g ms.\n",
           (float)( (cputstop.tms_utime + cputstop.tms_stime) -
                    (cputstart.tms_utime + cputstart.tms_stime) ) /
           (float)CLOCKS_PER_SEC * 1000);

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
