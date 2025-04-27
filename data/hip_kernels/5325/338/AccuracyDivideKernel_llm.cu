#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure only one thread performs the division
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}