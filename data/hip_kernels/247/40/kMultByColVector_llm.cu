#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate column index once
    const unsigned int column = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = column; i < width * height; i += stride) {
        unsigned int row = i / width; // Divide i into row and column
        tgtMat[i] = mat[i] * vec[row];
    }
}