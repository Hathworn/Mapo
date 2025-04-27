#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEqualsRowVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    // Calculate 2D indices to reduce modulo operation
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) {  // Check bounds
        // Access matrix using row-major order
        const unsigned int idx = row * width + col;
        tgtMat[idx] = mat[idx] == vec[col];
    }
}