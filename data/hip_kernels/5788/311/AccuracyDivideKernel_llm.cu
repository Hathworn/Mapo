#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using blockIdx and threadIdx
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index == 0) {
        *accuracy /= N; // Ensure correct execution by a single thread
    }
}