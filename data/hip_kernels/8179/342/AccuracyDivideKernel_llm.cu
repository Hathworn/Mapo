#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx and threadIdx to ensure only one thread performs the division
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}