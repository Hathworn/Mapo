#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    const int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate unique thread index
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}