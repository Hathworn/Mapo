#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifferenceKernel(const int len, const float* source, float* target) {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;
    
    // Ensure valid index within data bounds
    if (idx < len - 1) {
        // Perform computation
        target[idx] = source[idx + 1] - source[idx];
    }
}