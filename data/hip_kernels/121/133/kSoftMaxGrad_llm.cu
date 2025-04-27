#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGrad(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    // Calculate the unique global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Calculate the stride

    for (unsigned int i = idx; i < width * height; i += stride) { // Use stride in the loop
        unsigned int row = i / height; // Pre-compute row index for labels access
        unsigned int col = i % height; // Pre-compute column index
        target[i] = mat[i] - ((int)labels[row] == col ? 1 : 0); // Simplify condition checking
    }
}