//Reduction on array verification and kernel benchmark

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>

#define N 1000

int main(int argc, char **argv) {

  unsigned a[N];
  unsigned b[N];
  unsigned sum_a = 0;
  unsigned sum_b = 0;
  unsigned count = 0;

  for (int i = 0; i < N; i++) {
    a[i] = 0;
    b[i] = 0;
  }

  #pragma omp target teams num_teams(1) map(tofrom:a[0:N])
  {
    #pragma omp parallel for reduction(+:a[0:N])
    for (int i = 1; i < N-1; i++) {
      a[i-1] += 1;
      a[i]   += 2;
      a[i+1] += 4;
    }
  }

  for (int i = 1; i < N-1; i++) {
    b[i-1] += 1;
    b[i]   += 2;
    b[i+1] += 4;
  }

  for (int i = 0; i < N; i++) {
    sum_a += a[i];
    sum_b += b[i];
    printf("[%d]: %u, %u\n", i, a[i], b[i]);
  }

  printf("GPU sum: %u\n", sum_a);
  printf("CPU sum: %u\n%u", sum_b, count);
}
