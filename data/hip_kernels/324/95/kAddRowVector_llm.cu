#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate row and column index for the current element
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (col < width) { // Only execute if within matrix width
        for (unsigned int row = 0; row < height; ++row) {
            unsigned int idx = row * width + col;
            tgtMat[idx] = mat[idx] + vec[row]; // Direct row access
        }
    }
}