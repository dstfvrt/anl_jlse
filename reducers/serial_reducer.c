#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 1000

/*  Summary: serial reduction for 1mil unsigned values.
 *  Checksum: 499495.
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

    for (unsigned i = 0; i < N; i++) {
        result += h[i];
    } 

    printf("Checksum: %u\n", result);

    exit(0);
}
