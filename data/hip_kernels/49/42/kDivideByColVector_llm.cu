#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y; // Calculate row index
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x; // Calculate column index

    if (row < height && col < width) { // Ensure within matrix bounds
        const unsigned int index = row * width + col; // Compute linear index
        tgtMat[index] = __fdividef(mat[index], vec[row]); // Perform division
    }
}