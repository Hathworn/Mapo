#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Each thread block processes the division independently, assuming one block.
    if (threadIdx.x == 0) { // Use only the first thread for division to avoid race conditions
        *accuracy /= N;
    }
}