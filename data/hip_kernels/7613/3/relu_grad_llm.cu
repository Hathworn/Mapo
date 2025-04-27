#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized ReLU gradient kernel
__global__ void relu_grad(float *pre_grad, float *output, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within bounds and output value simultaneously
    if (i < rows && j < cols && output[i * cols + j] <= 0) {
        pre_grad[i * cols + j] = 0;
    }
}