#include "hip/hip_runtime.h"
#include "includes.h"

// Block-wise kernel for better concurrent execution
__global__ void kernelFeedForward2(float *zs, float *biases, int b_off, float *activations) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Unique index for each thread
    zs[idx] += biases[b_off + idx];
    activations[idx] = 1.0 / (1.0 + expf(-zs[idx]));
}