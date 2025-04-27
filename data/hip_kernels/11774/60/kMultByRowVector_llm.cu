#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Compute matrix row and column using thread index directly to avoid unnecessary calculations
    const unsigned int row = (blockIdx.x * blockDim.x + threadIdx.x) / width;
    const unsigned int col = (blockIdx.x * blockDim.x + threadIdx.x) % width;
    // Ensure index is within bounds and avoid bank conflicts by accessing memory in contiguous blocks
    if (row < height) {
        tgtMat[row * width + col] = mat[row * width + col] * vec[row];
    }
}