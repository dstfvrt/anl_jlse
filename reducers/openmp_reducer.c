#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N 1000000

unsigned a[N], b;

void dense_input() {
    #pragma omp for
    for (unsigned i = 0; i < N; i++) {
        a[i] = 24;
    }
}

int main(int argc, char **argv) {
    
    dense_input();

    #pragma omp parallel for
    for (unsigned i = 0; i < N; i++) {
        b += a[i];
    }

    printf("%d", b);
}
