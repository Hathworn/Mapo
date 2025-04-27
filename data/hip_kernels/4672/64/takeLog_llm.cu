#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    if (i < nhalf) {
        float value = input[j];
        // Use fmaxf to ensure logged value is always non-negative for log function
        env[i] = logf(fmaxf(value, 1e-20f));
    }
}