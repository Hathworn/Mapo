#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use improved branch divergence
    if (i >= nhalf) return;

    // Precompute the division for better performance
    float invNhalf = 1.0f / nhalf;
    env[i] = exp(env[i] * invNhalf);
}