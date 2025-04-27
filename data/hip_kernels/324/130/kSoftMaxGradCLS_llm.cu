#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradCLS(float* mat, int* labels, float* indices, float* target, unsigned int width, unsigned int height) {
    // Calculate flattened thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Launch one thread for each element
    if (idx < width * height) {
        // Determine column and row
        unsigned int col = idx / height;
        unsigned int row = idx % height;
        // Compute target value
        target[idx] = mat[idx] - (labels[(int)indices[row]] == col ? 1.0f : 0.0f);
    }
}