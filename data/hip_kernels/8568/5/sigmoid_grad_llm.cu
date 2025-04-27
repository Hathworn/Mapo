#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sigmoid_grad(float *pre_grad, float *output, int rows, int cols) {
    // Optimize to use a 1D block and grid structure for better occupancy
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = cols * rows;

    if (idx >= totalThreads) return;

    // Calculate row and column from 1D index
    int i = idx / cols;
    int j = idx % cols;

    float t = output[idx];
    pre_grad[idx] *= t * (1 - t);
}