#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height, float scaleVec) {
    // Calculate row and column indices for better memory access pattern
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) {
        tgtMat[row * width + col] = mat[row * width + col] + scaleVec * vec[col];
    }
}