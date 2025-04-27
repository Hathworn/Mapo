#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for better readability.
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if the thread index is 0 to avoid unnecessary operations in parallel block.
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}