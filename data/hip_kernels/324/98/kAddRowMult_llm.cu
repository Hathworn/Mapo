#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = idx / width; // Calculate row index
    const unsigned int col = idx % width; // Calculate column index
    if (row < height) { // Ensure index is within bounds
        tgtMat[idx] = mat[idx] + mult * vec[row];
    }
}