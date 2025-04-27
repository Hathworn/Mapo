#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = idx / width; // Calculate row index
    const unsigned int col = idx % width; // Calculate column index
    if(row < height && col < width) { // Ensure within bounds
        tgtMat[idx] = mat[idx] * vec[row]; // Multiply with corresponding vector element
    }
}