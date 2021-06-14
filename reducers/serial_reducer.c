#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>

#define N 65536

/*  Summary: serial reduction for 1mil unsigned values.
 *  Checksum: 499562283.
 */

void dense(unsigned* h) {

    srand(0);
    for (unsigned i = 0; i < N; i++) {
        h[i] = (unsigned)rand() % 1000;
    }
}

int main(int argc, char **argv) {

    /* Reduction variables */
    unsigned* h; 
    unsigned result = 0;
    unsigned nBytes;
    nBytes = N*sizeof(unsigned);

    h = (unsigned *)malloc(nBytes);
    dense(h);

    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);
    
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

    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);

    exit(0);
}
