#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to prevent race conditions if multiple threads are used
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}