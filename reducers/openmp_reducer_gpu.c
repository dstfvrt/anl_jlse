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

    h = (unsigned *)malloc(nBytes);
    dense(h);

    #pragma omp target teams distribute parallel for
    for (unsigned i = 0; i < N; i++) {
        result += h[i];
    } 

    printf("%d", result);

    exit(0);
}
