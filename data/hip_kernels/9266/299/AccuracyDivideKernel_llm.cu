#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure only one thread performs the division for global memory write
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}