#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function with shared memory and reduced memory access
__global__ void add(const int *a, const int *b, int *dest, const size_t length) {
    extern __shared__ int shared_a[], shared_b[];

    size_t tid = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;

    // Load data into shared memory
    if (tid < length) {
        shared_a[threadIdx.x] = a[tid];
        shared_b[threadIdx.x] = b[tid];
    }
    __syncthreads();

    // Perform computation using shared memory
    for (; tid < length; tid += stride) {
        dest[tid] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
    }
}