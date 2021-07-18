#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>
#include <omp.h>

namespace spray {
template <typename contentType, unsigned alignment = 256> class DenseReduction {
public:
  DenseReduction() { }

  DenseReduction(unsigned size, contentType *orig)
      : content(orig), size(size) { }

  ~DenseReduction() { }

  static void ompInit(DenseReduction<contentType> *__restrict__ init,
                      DenseReduction<contentType> *__restrict__ orig) {
    init->size = orig->size;
    init->content = reinterpret_cast<contentType *>(
        aligned_alloc(alignment, orig->size * sizeof(contentType)));
    for(int i=0; i<orig->size; i++) init->content[i] = 0;
    init->allocated = true;
  }

  static void ompReduce(DenseReduction<contentType> *__restrict__ out,
                        DenseReduction<contentType> *__restrict__ in) {
    contentType* outc = out->content;
    contentType* inc = in->content;
    if(!out->allocated) {
#pragma omp simd aligned(inc : alignment)
      for (int i = 0; i < out->size; i++)
        outc[i] += inc[i];
    }
    else {
#pragma omp simd aligned(outc, inc : alignment)
      for (int i = 0; i < out->size; i++)
        outc[i] += inc[i];
      free(inc);
    }
  }

  contentType &operator[](int idx) {
    return this->content[idx];
  }

private:
  contentType *content = nullptr;

  /// Size of the content.
  unsigned size = 0;

  /// A flag marking the object pointing to the original (user-provided) data.
  bool allocated = false;
};
} // namespace spray

#pragma omp declare reduction(+ : spray::DenseReduction<unsigned> : \
    spray::DenseReduction<unsigned>::ompReduce(&omp_out, &omp_in))                         \
    initializer (spray::DenseReduction<unsigned>::ompInit(&omp_priv, &omp_orig))

#define N 1000000

int main(int argc, char **argv) {

  /* Timing variables */
  struct timeval etstart, etstop;
  struct timezone tzdummy;
  clock_t etstart2, etstop2;
  unsigned long long usecstart, usecstop;
  struct tms cputstart, cputstop;

  unsigned a[N];
  spray::DenseReduction<unsigned> arr_p(N, a);

  /* Start Clock */
  printf("\nStarting clock.\n");
  gettimeofday(&etstart, &tzdummy);
  etstart2 = times(&cputstart);

  #pragma omp target teams distribute parallel for reduction(+:arr_p) map(tofrom:arr_p[0:N])
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
