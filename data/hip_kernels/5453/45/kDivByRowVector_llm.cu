```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate row and column indices
    unsigned int col = threadIdx.x + blockIdx.x * blockDim.x;
    if (col < width) {  // Ensure column index is within bounds
        for (unsigned int row = 0; row < height; ++row) {  // Iterate over each row
            unsigned int idx = row * width + col;
            tgtMat[idx] = mat[idx] / vec[row];
        }
    }
}