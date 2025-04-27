#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x and threadIdx.x to ensure operation by only one thread
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}