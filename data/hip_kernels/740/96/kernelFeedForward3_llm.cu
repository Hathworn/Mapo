#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelFeedForward3(float *zs, float *biases, int b_off, float *activations) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index once
    float z = zs[idx] + biases[b_off + threadIdx.x]; // Use a local variable for efficiency
    activations[idx] = 1.0f / (1.0f + expf(-z)); // Directly use local variable
}