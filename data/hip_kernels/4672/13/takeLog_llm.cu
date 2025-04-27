#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void takeLog(float* input, float* env, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        int j = i << 1; // Separate index calculation to avoid redundant operations
        float val = input[j]; // Load input value once
        env[i] = log(fmaxf(val, 1e-20f)); // Use fmaxf for streamlined comparison and single function call
    }
}