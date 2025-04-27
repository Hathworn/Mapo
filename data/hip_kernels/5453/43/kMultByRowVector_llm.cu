#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate 2D index for matrix elements
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) {
        unsigned int index = row * width + col;
        tgtMat[index] = mat[index] * vec[row]; // Multiply with corresponding vector element
    }
}