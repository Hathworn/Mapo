#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThanRowVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    // Calculate the row and column indices directly
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we are within matrix bounds
    if (row < height && col < width) {
        unsigned int i = row * width + col;
        tgtMat[i] = mat[i] > vec[col];
    }
}