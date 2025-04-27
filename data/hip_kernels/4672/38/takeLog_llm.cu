#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    
    // Efficient check within thread limit for better performance
    if (i < nhalf) {
        // Avoid branching by using the ternary operator directly in computation
        float value = input[j];
        env[i] = logf(fmaxf(value, 1e-20f));  // Take the log safely with built-in functions
    }
}