#ifndef OMPHOST_HPP
#define OMPHOST_HPP

namespace foo {
template <typename contentType> class AtomicScalar {
public:
  AtomicScalar(contentType *val) { this->val = val; }

  void operator+=(contentType rhs) {
#pragma omp atomic update
    *(this->val) += rhs;
  }

private:
  contentType *val;
};

template <typename contentType> class AtomicReduction {
public:
  AtomicReduction() { this->initialized = false; }

  AtomicReduction(contentType *orig) {
    this->orig = orig;
    this->initialized = true;
  }

  static void ompInit(AtomicReduction<contentType> *init,
                      AtomicReduction<contentType> *orig) {
    init->orig = orig->orig;
    init->initialized = true;
  }

  static void ompReduce(AtomicReduction<contentType> *out,
                        AtomicReduction<contentType> *in) {
  }

  AtomicScalar<contentType> operator[](int idx) {
    return AtomicScalar<contentType>(this->orig + idx);
  }

private:
  contentType *orig;
  bool initialized;
};
} // namespace spray

#pragma omp declare reduction(+ : foo::AtomicReduction<double> : \
    foo::AtomicReduction<double>::ompReduce(&omp_out, &omp_in))                         \
    initializer (foo::AtomicReduction<double>::ompInit(&omp_priv, &omp_orig))

#pragma omp declare reduction(+ : foo::AtomicReduction<float> : \
    foo::AtomicReduction<float>::ompReduce(&omp_out, &omp_in))                         \
    initializer (foo::AtomicReduction<float>::ompInit(&omp_priv, &omp_orig))
#endif
