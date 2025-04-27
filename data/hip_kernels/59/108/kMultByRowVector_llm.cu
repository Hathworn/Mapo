#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate row and column indices
    unsigned int rowIdx = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int colIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds
    if (rowIdx < height && colIdx < width) {
        unsigned int idx = rowIdx * width + colIdx;
        // Multiply by corresponding row vector element
        tgtMat[idx] = mat[idx] * vec[rowIdx];
    }
}
```
