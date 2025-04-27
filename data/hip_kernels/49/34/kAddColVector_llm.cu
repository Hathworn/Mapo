#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, const unsigned int width, const unsigned int height, const float scaleVec) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Process multiple elements per thread to reduce global memory accesses
    for (unsigned int i = idx; i < width * height; i += stride) {
        tgtMat[i] = mat[i] + scaleVec * vec[i / width];
    }
}