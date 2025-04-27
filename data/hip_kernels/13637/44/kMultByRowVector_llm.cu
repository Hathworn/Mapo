#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate indices for the current thread
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the thread accesses a valid element
    if (col < width && row < height) {
        unsigned int i = row * width + col;
        tgtMat[i] = mat[i] * vec[row];
    }
}