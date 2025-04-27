#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to divide accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}