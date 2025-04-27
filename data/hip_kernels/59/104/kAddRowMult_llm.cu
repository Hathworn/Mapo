#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to add row-wise multiplied vector
__global__ void kAddRowMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    // Calculate the thread index within the grid
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int rowIdx = idx / width; // Determine the row index
    const unsigned int colIdx = idx % width; // Determine the column index

    if (rowIdx < height) { // Ensure row index is within bounds
        tgtMat[idx] = mat[idx] + mult * vec[rowIdx];
    }
}