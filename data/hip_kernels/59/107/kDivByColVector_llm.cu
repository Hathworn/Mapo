#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate row and column indices for a 2D grid of blocks
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure that we do not go out of bounds
    if (col < width && row < height) {
        // Perform division operation
        tgtMat[row * width + col] = mat[row * width + col] / vec[row];
    }
}