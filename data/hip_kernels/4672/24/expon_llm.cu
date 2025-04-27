#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only necessary elements within bounds
    if (i < nhalf) {
        // Exponentiate efficiently
        env[i] = expf(env[i] / nhalf);
    }
}