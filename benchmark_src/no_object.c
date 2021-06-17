
#define N 1000

int main(int argc, char **argv) {

  #pragma omp target
  {
    /* Timing variables */
    struct timeval etstart, etstop;
    struct timezone tzdummy;
    clock_t etstart2, etstop2;
    unsigned long long usecstart, usecstop;
    struct tms cputstart, cputstop;

    unsigned arr_p[N];

    /* Start Clock */
    printf("\nStarting clock.\n");
    gettimeofday(&etstart, &tzdummy);
    etstart2 = times(&cputstart);

    #pragma omp parallel for reduction(+:arr_p)
    for (int i = 1; i < N-1; i++) {
      arr_p[i-1] += 1;
      arr_p[i]   += 2;
      arr_p[i+1] += 4;
    }

    /* Stop Clock */
    gettimeofday(&etstop, &tzdummy);
    etstop2 = times(&cputstop);
    printf("Stopped clock.\n");
    usecstart = (unsigned long long)etstart.tv_sec * 1000000 + etstart.tv_usec;
    usecstop = (unsigned long long)etstop.tv_sec * 1000000 + etstop.tv_usec;
    printf("\nElapsed time = %g ms.\n",
           (float)(usecstop - usecstart)/(float)1000);
  }
}
