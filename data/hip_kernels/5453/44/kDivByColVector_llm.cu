#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int rowIdx = idx / width; // Calculate row index
    const unsigned int colIdx = idx % width; // Calculate column index

    if (rowIdx < height) {
        tgtMat[idx] = mat[idx] / vec[rowIdx]; // Perform division only if within bounds
    }
}