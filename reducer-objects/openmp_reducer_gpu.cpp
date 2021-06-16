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

int main(int argc, char **argv) {
    
    unsigned a;
    a = 0; 

    #pragma omp target
    {
      foobar::AtomicReduction<unsigned> arr_p(&a);
      #pragma omp parallel for reduction(+:arr_p)
      for (int i = 1; i < N; i++) {
          arr_p[0] += 1;
      }

      printf("Checksum: %u\n", a);
    }
}
