#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for scalar lower bound
__global__ void kLowerBoundScalar(float* mat, float val, float* target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;
    // Use strided loop for better memory coalescing
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = fmaxf(mat[i], val); // Use fmaxf for potential performance gain
    }
}