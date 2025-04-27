#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Use blockIdx.y to allow threads to directly compute corresponding row operations
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (row < height && col < width) {
        const unsigned int i = row * width + col;
        tgtMat[i] = mat[i] + vec[row];
    }
}