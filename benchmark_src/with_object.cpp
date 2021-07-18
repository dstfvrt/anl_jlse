#include <stdio.h>
#include <stdlib.h>

extern "C" {
	void RINIT();
	void REDUCE();
}

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
          malloc(orig->size * sizeof(contentType)));
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
} //namespace spray

#pragma omp declare reduction(+ : spray::DenseReduction<unsigned> : \
    spray::DenseReduction<unsigned>::ompReduce(&omp_out, &omp_in))                         \
    initializer (spray::DenseReduction<unsigned>::ompInit(&omp_priv, &omp_orig))

# define N 1000

int main(int argc, char **argv) {

  #pragma omp target teams num_teams(1)
  {
    unsigned a[N];
    spray::DenseReduction<unsigned> arr_p(N, a);
    #pragma omp parallel for reduction(+:arr_p)
    for (int i = 1; i < N - 1; i++) {
      arr_p[i-1] += 1;
      arr_p[i]   += 2;
      arr_p[i+1] += 4;
    }
  }
}
