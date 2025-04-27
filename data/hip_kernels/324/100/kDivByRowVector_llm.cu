#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use stride loop to improve memory access patterns
    for (unsigned int i = idx; i < width * height; i += stride) {
        unsigned int row = i / width;
        target[i] = mat[i] / vec[row];
    }
}