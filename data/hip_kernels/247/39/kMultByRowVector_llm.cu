#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate thread-specific row and column
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to ensure no out-of-bounds memory access
    if (row < height && col < width) {
        // Flattened index in matrix
        unsigned int idx = row * width + col;
        // Perform multiplication
        tgtMat[idx] = mat[idx] * vec[col];
    }
}