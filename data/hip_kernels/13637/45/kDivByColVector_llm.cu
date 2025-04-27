#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (idx < width * height) {
        unsigned int colIndex = idx / height;
        tgtMat[idx] = mat[idx] / vec[colIndex];
    }
}