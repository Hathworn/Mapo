#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) { // Boundary check for valid rows and columns
        tgtMat[row * width + col] = mat[row * width + col] + vec[row]; // Direct indexing for row and column
    }
}