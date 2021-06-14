#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 1000000

void dense(unsigned* h) {

    srand((unsigned)time(NULL));
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

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

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);
    
    #pragma omp target teams distribute parallel for
    for (unsigned i = 0; i < N; i++) {
        result += h[i];
    } 

    /* Stop Clock */
    gettimeofday(&etstop, &tzdummy);
    etstop2 = times(&cputstop);
    printf("Stopped clock.\n");
    usecstart = (unsigned long long)etstart.tv_sec * 1000000 + etstart.tv_usec;
    usecstop = (unsigned long long)etstop.tv_sec * 1000000 + etstop.tv_usec;

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
