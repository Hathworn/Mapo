#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x and threadIdx.x to ensure only one thread updates
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}