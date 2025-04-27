#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int column = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the thread is within matrix bounds
    if (column < width && row < height) {
        unsigned int index = row * width + column;
        // Optimize by accessing memory in a coalesced manner
        tgtMat[index] = mat[index] + vec[row];
    }
}
```
