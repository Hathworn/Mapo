#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the global index
    const unsigned int globalIdx = row * width + col;
    
    // Ensure within bounds
    if (col < width && row < height) {
        tgtMat[globalIdx] = mat[globalIdx] * vec[row];
    }
}