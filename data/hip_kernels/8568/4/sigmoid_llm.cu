#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid(float *inout, float *bias, int rows, int cols) {
    // Calculate global thread index
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if thread exceeds bounds
    if (j >= cols || i >= rows) return;

    // Efficient memory access and computation
    int index = i * cols + j;
    float t = inout[index];
    inout[index] = 1.0f / (1.0f + expf(-t)) + bias[i];
}