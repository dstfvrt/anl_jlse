#ifndef CUDAREDUCE_HPP
#define CUDAREDUCE_HPP

namespace bar {
template <typename contentType> class AtomicScalar {
public:
  __device__ __host__ AtomicScalar(contentType *val) { this->val = val; }

  __host__ void dispScalar() { printf("%u\n", *this->val); }

  __device__ void operator+=(AtomicScalar<contentType> rhs) {
    atomicAdd(this->val, *(rhs.val));
  }

private:
  contentType *val;
};

template <typename contentType> class AtomicReduction {
public:
  AtomicReduction() { this->initialized = false; }

  __host__ AtomicReduction(contentType *orig) {
    this->orig = orig;
    this->initialized = true;

    cudaError_t err = cudaMallocManaged(&orig, sizeof(orig));
    if (err != cudaSuccess) {
        printf("Memory allocation failed");
    }
  }

  __device__ __host__ AtomicScalar<contentType> operator[](int idx) {
    return AtomicScalar<contentType>(this->orig + idx);
  }

private:
  contentType *orig;
  bool initialized;
};
} // namespace bar
#endif
