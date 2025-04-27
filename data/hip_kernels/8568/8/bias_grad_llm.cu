#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bias_grad(float *pre_grad, float *output, int rows, int cols) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= rows) return;

    // Initialize output[i] to zero
    float sum = 0;

    // Unroll the loop for better performance
    for (int k = 0; k < cols; k += 4) {
        if (k < cols) sum += pre_grad[i * cols + k];
        if (k + 1 < cols) sum += pre_grad[i * cols + k + 1];
        if (k + 2 < cols) sum += pre_grad[i * cols + k + 2];
        if (k + 3 < cols) sum += pre_grad[i * cols + k + 3];
    }

    // Write the computed sum to output
    output[i] = sum;
}