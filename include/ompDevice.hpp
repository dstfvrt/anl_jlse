#ifndef OMPDEVICE_HPP
#define OMPDEVICE_HPP

namespace foobar {
template <typename contentType> class AtomicScalar {
public:
  AtomicScalar(contentType *val) { this->val = val; }

  void dispScalar() { printf("%u\n", *this->val); }

  void operator+=(AtomicScalar<contentType> rhs) {
    #pragma omp target use_ptr(this->val,rhs->val) {
      atomicAdd(this->val, rhs.val);
    }
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
} // namespace foobar

#pragma omp declare reduction(+ : foobar::AtomicReduction<double> : \
    foobar::AtomicReduction<double>::ompReduce(&omp_out, &omp_in))                         \
    initializer (foobar::AtomicReduction<double>::ompInit(&omp_priv, &omp_orig))

#pragma omp declare reduction(+ : foobar::AtomicReduction<float> : \
    foobar::AtomicReduction<float>::ompReduce(&omp_out, &omp_in))                         \
    initializer (foobar::AtomicReduction<float>::ompInit(&omp_priv, &omp_orig))

#pragma omp declare reduction(+ : foobar::AtomicReduction<unsigned> : \
    foobar::AtomicReduction<unsigned>::ompReduce(&omp_out, &omp_in))                         \
    initializer (foobar::AtomicReduction<unsigned>::ompInit(&omp_priv, &omp_orig))
#endif
