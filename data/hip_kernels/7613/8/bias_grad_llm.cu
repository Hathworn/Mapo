#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bias_grad(float *pre_grad, float *output, int rows, int cols) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < rows) {
        float sum = 0.0f; // Use a local variable to store the sum
        for (int k = 0; k < cols; k++) {
            sum += pre_grad[i * cols + k];
        }
        output[i] = sum; // Write the accumulated sum to the output
    }
}