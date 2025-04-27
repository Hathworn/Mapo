#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize by using blockIdx.x == 0, threadIdx.x == 0 to execute once
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}