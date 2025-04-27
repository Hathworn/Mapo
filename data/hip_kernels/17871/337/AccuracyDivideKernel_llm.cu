#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimization: Ensure accuracy pointer is aligned globally 
    if (threadIdx.x == 0) { // Process only thread 0 for this block
        *accuracy /= N;     // Prevent redundant operations across threads
    }
}