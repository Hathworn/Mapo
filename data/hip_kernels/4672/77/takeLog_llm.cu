#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nhalf) {
        int j = i << 1;
        float val = fmaxf(input[j], 1e-20f);  // Ensure non-negative input for log
        env[i] = logf(val);  // Use logf for improved precision and performance with floats
    }
}