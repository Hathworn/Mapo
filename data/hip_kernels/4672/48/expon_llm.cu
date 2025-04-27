#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to increase efficiency
    if (i < nhalf) {
        env[i] = expf(env[i] / nhalf); // Use expf for single precision
        if (i + blockDim.x < nhalf) {
            env[i + blockDim.x] = expf(env[i + blockDim.x] / nhalf);
        }
    }
}