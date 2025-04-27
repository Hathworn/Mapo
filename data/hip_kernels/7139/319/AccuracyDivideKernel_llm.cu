#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) { // Ensure division is done once using a single thread
        *accuracy /= N;
    }
}