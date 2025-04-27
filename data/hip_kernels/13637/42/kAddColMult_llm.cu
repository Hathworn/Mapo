#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    // Calculate global index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Stride loop with multiple elements per thread
    unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < width * height; i += stride) {
        tgtMat[i] = mat[i] + mult * vec[i % height];
    }
}