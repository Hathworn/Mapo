#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by replacing atomic operation to avoid data race
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) {  // Use only one thread to perform division
        *accuracy /= N;
    }
}