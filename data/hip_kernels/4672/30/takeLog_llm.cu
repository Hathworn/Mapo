#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void takeLog(float* input, float* env, int nhalf) {
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int dataIndex = globalIndex << 1;
    
    // Process only within the valid range
    if (globalIndex < nhalf) {
        float value = input[dataIndex];
        // Use fmaxf for better performance with small values
        env[globalIndex] = logf(fmaxf(value, 1e-20f));
    }
}