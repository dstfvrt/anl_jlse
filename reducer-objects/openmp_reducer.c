#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>
#include <omp.h>
#include <ompHost.hpp>

#define N 1000

void dense_input(unsigned* a) {
    srand(0);
    for (unsigned i = 0; i < N; i++) {
        a[i] = (unsigned)rand() % 1000;
    }
}

int main(int argc, char **argv) {
    
    unsigned* a;
    a = (unsigned *)malloc(N*sizeof(unsigned));
    dense_input(a);

    foo::AtomicReduction<unsigned> arr_p(a);
    #pragma omp parallel for reduction(+:arr_p)
    for (int i = 1; i < N; i++) {
        arr_p[0] += arr_p[i];
    }

    printf("Checksum: %u\n", a[0]);
}
