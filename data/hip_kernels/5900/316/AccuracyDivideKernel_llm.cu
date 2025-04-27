#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check for a valid index to avoid unused threads
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N; // Only one thread performs the division
    }
}