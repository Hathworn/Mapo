#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, const unsigned int width, const unsigned int height, const float scaleVec) {
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate row index
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate column index

    if (row < height && col < width) {  // Check bounds
        unsigned int idx = row * width + col;  // Calculate linear index
        tgtMat[idx] = mat[idx] + scaleVec * vec[row];  // Perform operation
    }
}
```
