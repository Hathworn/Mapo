#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function to divide accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Each thread calculates its portion of the division
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) { // Only the first thread performs the division
        *accuracy /= N;
    }
}