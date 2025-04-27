#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to avoid possible race conditions and improve clarity
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Ensure single thread executes the division
        *accuracy /= N;
    }
}