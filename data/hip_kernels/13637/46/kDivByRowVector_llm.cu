#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += stride) {
        // Perform division using precomputed indices to minimize calculations
        unsigned int rowIdx = i / width;
        tgtMat[i] = mat[i] / vec[rowIdx];
    }
}