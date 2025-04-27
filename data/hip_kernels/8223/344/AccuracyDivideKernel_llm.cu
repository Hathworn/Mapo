#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x and threadIdx.x to differentiate threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        // Only one thread performs the division to prevent race conditions
        *accuracy /= N;
    }
}