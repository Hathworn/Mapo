#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to handle multiple accuracy calculations
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}