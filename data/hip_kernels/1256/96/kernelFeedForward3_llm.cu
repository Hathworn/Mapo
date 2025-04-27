#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelFeedForward3(float *zs, float *biases, int b_off, float *activations) {
    // Use a single computation for the thread's index:
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load bias and update zs in a separate step for better readability:
    float bias = biases[b_off + threadIdx.x];
    zs[idx] += bias;

    // Optimize activation computation with single expf call:
    float z = zs[idx];
    activations[idx] = 1.0f / (1.0f + expf(-z));
}