#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void kDivideScalar(float* mat, float alpha, float* dest, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Replace numThreads with stride for better readability and consistency
    for (unsigned int i = idx; i < len; i += stride) {
        dest[i] = mat[i] / alpha;
    }
}