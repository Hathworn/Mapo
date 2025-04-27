#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure single thread performs the division to prevent race conditions
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}