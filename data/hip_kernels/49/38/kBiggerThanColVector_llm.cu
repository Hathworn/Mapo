#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThanColVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    // Calculate 2D indices for matrix to improve memory access pattern
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int yStride = blockDim.y * gridDim.y;
    
    for (unsigned int y = blockIdx.y * blockDim.y + threadIdx.y; y < height; y += yStride) {
        if (x < width) { // Boundary check for width
            const unsigned int i = y * width + x;
            tgtMat[i] = mat[i] > vec[y];
        }
    }
}