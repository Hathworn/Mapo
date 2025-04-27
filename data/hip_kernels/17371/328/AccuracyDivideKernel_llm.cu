#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Safeguard to prevent division by zero
    if (N != 0) {
        *accuracy /= N;
    }
}