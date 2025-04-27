#include "hip/hip_runtime.h"
#include "includes.h"

// Divide accuracy by N using a single thread to prevent data races
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) {  // Ensure only one thread performs the division
        *accuracy /= N;
    }
}