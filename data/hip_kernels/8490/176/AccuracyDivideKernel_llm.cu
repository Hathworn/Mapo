#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to ensure parallel execution
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate the index position for the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only one thread performs division to avoid race condition
    if (idx == 0) {
        *accuracy /= N;
    }
}