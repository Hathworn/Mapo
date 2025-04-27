#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Launch single thread to perform whole division operation
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}