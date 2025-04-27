#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with thread check
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}