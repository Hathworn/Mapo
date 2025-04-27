#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate row and column based on global index
    unsigned int row = idx / width;
    unsigned int col = idx % width;

    // Ensure the index is within bounds
    if (row < height && col < width) {
        // Update the target matrix with the element-wise sum using row vector
        tgtMat[row * width + col] = mat[row * width + col] + vec[col];
    }
}