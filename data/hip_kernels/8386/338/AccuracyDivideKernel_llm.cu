#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to compute accuracy directly in device
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a single thread to avoid race conditions and unnecessary computation
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}