#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <ompHost.hpp>

#define N 1000

unsigned a[N], b;

void dense_input(unsigned* a) {
    for (unsigned i = 0; i < N; i++) {
        a[i] = 24;
    }
}

int main(int argc, char **argv) {
    
    unsigned* a;
    a = (unsigned *)malloc(N*sizeof(unsigned))
    dense_input(a);

    foo::AtomicReduction<unsigned>arr_p(a);
    #pragma omp parallel for reduction(+:arr_p)
    for (unsigned i = 1; i < N; i++) {
        a[0] += a[i];
    }

    printf("Checksum: %u\n", a[0]);
}
