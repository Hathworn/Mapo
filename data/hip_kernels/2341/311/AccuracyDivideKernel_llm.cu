#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function to launch a single thread
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Ensure a single thread executes
        *accuracy /= N;
    }
}