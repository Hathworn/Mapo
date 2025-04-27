#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Prevent threads from processing out of range data
    if (i >= nhalf) return;

    // Improved exponentiation operation with better memory access pattern
    const float inv_nhalf = 1.0f / nhalf;
    env[i] = exp(env[i] * inv_nhalf);
}