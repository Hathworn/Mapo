#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Simplify with stride instead of numThreads

    // Use 'stride' instead of incrementing by numThreads
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = sqrtf(mat[i]); // Use 'sqrtf' for better performance with 'float'
    }
}