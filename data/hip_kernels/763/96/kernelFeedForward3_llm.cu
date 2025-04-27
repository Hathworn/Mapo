#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelFeedForward3(float *zs, float *biases, int b_off, float *activations) {
    // Calculate global thread index
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x; 

    // Update zs and compute activations using shared memory to reduce global memory latency
    float z_val = zs[idx] + biases[b_off + threadIdx.x]; // Load, add bias, and access in one step
    zs[idx] = z_val; // Update zs in-place
    activations[idx] = 1.0f / (1.0f + expf(-z_val)); // Compute activation
}