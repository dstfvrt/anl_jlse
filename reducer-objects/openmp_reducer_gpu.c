#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>
#include <omp.h>
#include <ompDevice.hpp>

#define N 1000

void dense(unsigned* a) {
    srand(0);
    for (unsigned i = 0; i < N; i++) {
        a[i] = (unsigned)rand() % 1000;
    }
}

int main(int argc, char **argv) {
    unsigned* h;
    h = (unsigned *)malloc(N*sizeof(unsigned));
    dense(h);

    #pragma omp declare target
    foobar::AtomicReduction<unsigned>arr_h(h);
    #pragma omp end declare target

    #pragma omp target
    {
        #pragma omp target teams distribute parallel for reduction(+:arr_h[0])
        for (unsigned i = 0; i < N; i++) {
            arr_h[0] += arr_h[i];
        }
    }

    printf("Checksum: %u\n", arr_h[0].dispScalar());
}
