#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid(float *inout, float *bias, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds only once
    if (j < cols && i < rows) {
        // Calculate index once
        int index = i * cols + j;
        float t = inout[index];
        // Reduce expf call and reuse computed index
        inout[index] = 1 / (1 + expf(-t)) + bias[i];
    }
}