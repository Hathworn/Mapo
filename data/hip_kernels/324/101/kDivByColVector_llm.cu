```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y; // Optimize for 2D grid/block
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (row < height && col < width) { // Use boundary checks
        const unsigned int idx = row * width + col;
        tgtMat[idx] = mat[idx] / vec[row]; // Use row directly for vec index
    }
}
```
