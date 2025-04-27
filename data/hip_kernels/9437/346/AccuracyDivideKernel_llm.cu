#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize by using local thread to prevent atomic operations
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}