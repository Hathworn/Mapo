#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nhalf) {
        float value = input[i << 1];               // Optimized: Pre-compute the index for clarity
        env[i] = logf(fmaxf(value, 1e-20f));       // Optimized: Use logf and fmaxf for float precision
    }
}