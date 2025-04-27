#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward2(float *zs, float *biases, int b_off, float *activations) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index

    if (idx < b_off) {  // Bounds checking
        zs[idx] += biases[b_off + idx];  // Update zs using biases
        activations[idx] = 1.0f / (1.0f + expf(-zs[idx]));  // Compute activation
    }
}