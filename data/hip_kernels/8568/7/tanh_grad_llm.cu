#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanh_grad(float *pre_grad, float *output, int rows, int cols) {
    // Compute flattened index from 2D block and thread indices
    int index = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;
    
    if (index < rows * cols) { // Ensure the index is within bounds
        float t = output[index];
        pre_grad[index] *= 1 - t * t;
    }
}