#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate unique thread index
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds of the matrix
    if (x < width && y < height) {
        unsigned int index = y * width + x;
        tgtMat[index] = mat[index] + vec[y];  // Efficient vector addition using 2D indices
    }
}