#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to optimize accuracy division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use single thread to perform division for efficiency
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}