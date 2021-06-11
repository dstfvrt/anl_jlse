#include <stdio.h>
#include <stdlib.h>

#define N 1000000

unsigned a[N], b;

void dense_input() {
    for (unsigned i = 0; i < N; i++) {
        a[i] = 24;
    }
}

int main(int argc, char **argv) {
    
    dense_input();

    for (unsigned i = 0; i < N; i++) {
        b += a[i];
    }
    
    printf("%d", b);
}
