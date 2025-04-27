#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate 2D grid and block indices for improved memory coalescing
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to prevent accessing out of range
    if (col < width && row < height) {
        unsigned int idx = row * width + col;
        tgtMat[idx] = mat[idx] / vec[row];
    }
}