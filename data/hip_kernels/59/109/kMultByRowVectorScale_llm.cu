#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVectorScale(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height, float scale_targets) {
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate row index
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate column index

    if (row < height && col < width) {  // Ensure we are within matrix bounds
        const unsigned int idx = row * width + col;  // Calculate linear index for matrix
        tgtMat[idx] = scale_targets * tgtMat[idx] + mat[idx] * vec[row];  // Optimized computation
    }
}