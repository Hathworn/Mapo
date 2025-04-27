#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate row and column index
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use row-major order to access elements based on row and column indices
    if (row < height && col < width) {
        unsigned int idx = row * width + col;
        tgtMat[idx] = mat[idx] * vec[row];
    }
}