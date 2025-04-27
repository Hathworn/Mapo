#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward3(float *zs, float *biases, int b_off, float *activations) {
    // Calculate global thread index
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use a single array access expression
    float z_val = zs[idx] + biases[b_off + threadIdx.x];
    
    // Write back the computation
    zs[idx] = z_val;
    
    // Optimized activation computation
    activations[idx] = 1.0 / (1.0 + expf(-z_val));
}