#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>

#define N 1000

int main(int argc, char **argv) {

  #pragma omp target teams num_teams(1)
  {
    unsigned a[N];
    #pragma omp parallel for reduction(+:a)
    for (int i = 1; i < N-1; i++) {
      a[i-1] += 1;
      a[i]   += 2;
      a[i+1] += 4;
    }
  }
}
