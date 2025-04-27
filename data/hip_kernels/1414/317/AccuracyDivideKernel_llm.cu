#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by adding const qualifier and using grid-stride loop
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}