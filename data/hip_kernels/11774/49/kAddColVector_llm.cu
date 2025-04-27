#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate the row and column index for each thread
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col < width && row < height) {
        unsigned int index = row * width + col; // Compute linear index
        // Perform the addition operation
        tgtMat[index] = mat[index] + vec[row];
    }
}
```
