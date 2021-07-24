#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

// Scott Grauer-Gray (sgrauerg@gmail.com)
// Functions used across hmpp codes

// define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 0.05

/* Problem size. */
#define NI 100
#define NJ 100
#define NK 100

/* Declared constant values for ALPHA and BETA (same as values in PolyBench 2.0)
 */
#define ALPHA 412.0f
#define BETA 123.0f

// define a small float value
#define SMALL_FLOAT_VAL 0.00000001f

/* Can switch DATA_TYPE between float and double */
typedef float DATA_TYPE;

double rtclock() {
  struct timezone Tzp;
  struct timeval Tp;
  int stat;
  stat = gettimeofday(&Tp, &Tzp);
  if (stat != 0)
    printf("Error return from gettimeofday: %d", stat);
  return (Tp.tv_sec + Tp.tv_usec * 1.0e-6);
}

float absVal(float a) {
  if (a < 0) {
    return (a * -1);
  } else {
    return a;
  }
}

float percentDiff(double val1, double val2) {
  if ((absVal(val1) < 0.01) && (absVal(val2) < 0.01)) {
    return 0.0f;
  }

  else {
    return 100.0f *
           (absVal(absVal(val1 - val2) / absVal(val1 + SMALL_FLOAT_VAL)));
  }
}


void gemm(DATA_TYPE A[NI * NK], DATA_TYPE B[NK * NJ], DATA_TYPE C[NI * NJ]) {
  int i, j, k;

  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++) {
      C[i * NJ + j] *= BETA;

      for (k = 0; k < NK; ++k) {
        C[i * NJ + j] += ALPHA * A[i * NK + k] * B[k * NJ + j];
      }
    }
  }
}

void gemm_OMP(DATA_TYPE A[NI * NK], DATA_TYPE B[NK * NJ],
              DATA_TYPE C[NI * NJ], DATA_TYPE Cinit[NI * NJ]) {
  #pragma omp target data map(to:A[0:NI*NK], B[0:NK*NJ], Cinit[0:NI*NJ]) map(from:C[0:NI*NJ])
  {
    #pragma omp target teams distribute \
              parallel for reduction(+:C[0:NI*NJ])
    for (int i = 0; i < NI; i++) {
      for (int j = 0; j < NJ; j++) {
        C[i * NJ + j] = Cinit[i * NJ + j] * BETA;
        for (int k = 0; k < NK; ++k) {
          C[i * NJ + j] += ALPHA * A[i * NK + k] * B[k * NJ + j];
        }
      }
    }
  }
}

void init(DATA_TYPE A[NI * NK], DATA_TYPE B[NK * NJ],
	  DATA_TYPE C[NI * NJ], DATA_TYPE C_OMP[NI * NJ]) {
  int i, j;

  for (i = 0; i < NI; i++) {
    for (j = 0; j < NK; j++) {
      A[i * NK + j] = ((DATA_TYPE)i * j) / NI;
    }
  }

  for (i = 0; i < NK; i++) {
    for (j = 0; j < NJ; j++) {
      B[i * NJ + j] = ((DATA_TYPE)i * j + 1) / NJ;
    }
  }

  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++) {
      C[i * NJ + j] = ((DATA_TYPE)i * j + 2) / NJ;
      C_OMP[i * NJ + j] = ((DATA_TYPE)i * j + 2) / NJ;
    }
  }
}

int compareResults(DATA_TYPE *C, DATA_TYPE *C_outputFromGpu) {
  int i, j, fail;
  fail = 0;

  // Compare C1 and C2
  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++) {
      if (percentDiff(C[i * NJ + j], C_outputFromGpu[i * NJ + j]) >
          PERCENT_DIFF_ERROR_THRESHOLD) {
        fail++;
        printf("%f != %f \n", C[i * NJ + j],
                C_outputFromGpu[i * NJ + j]);
      }
    }
  }

  // Print results
  printf("Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f "
         "Percent: %d\n",
         PERCENT_DIFF_ERROR_THRESHOLD, fail);

  return fail;
}

int main(int argc, char *argv[]) {
  double t_start, t_end;
  int fail = 0;

  DATA_TYPE A[NI * NK];
  DATA_TYPE B[NK * NJ];
  DATA_TYPE C[NI * NJ];
  DATA_TYPE C_outputFromGpu[NI * NJ];
  DATA_TYPE Cinit_outputFromGpu[NI * NJ];

  init(A, B, C, Cinit_outputFromGpu);

  gemm_OMP(A, B, C_outputFromGpu, Cinit_outputFromGpu);

  t_start = rtclock();
  gemm(A, B, C);
  t_end = rtclock();
  printf("CPU Runtime: %0.6lfs\n", t_end - t_start);

  fail = compareResults(C, C_outputFromGpu);

  return fail;
}
