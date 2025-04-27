#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to divide accuracy by N using a single thread
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Ensure single execution
        *accuracy /= N;
    }
}