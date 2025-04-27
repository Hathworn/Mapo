#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread ID check to ensure only one thread performs the division
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}