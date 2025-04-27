#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* mat, float* target, unsigned int len) {
    // Calculate the index for this thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over each element this thread should process.
    // Use stride to ensure all elements are covered by all threads.
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = sqrtf(mat[i]);  // Use sqrtf for single precision float
    }
}