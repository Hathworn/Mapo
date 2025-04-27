#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to divide accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a single thread to perform the division
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}