#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanh(float *inout, float *bias, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Use if statement to ensure only valid threads perform operations
    if (j < cols && i < rows) {
        float value = inout[i * cols + j];
        inout[i * cols + j] = tanhf(value) + bias[i];
    }
}