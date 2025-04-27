#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop with stride to cover all elements efficiently
    for (unsigned int i = idx; i < width * height; i += stride) {
        unsigned int row = i / width;  // Calculate row and column only once
        unsigned int col = i % width;
        target[row * width + col] = mat[row * width + col] - ((int)labels[col] == row ? 1 : 0);
    }
}