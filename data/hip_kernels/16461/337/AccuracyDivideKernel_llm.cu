#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to divide accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to perform the operation to avoid race conditions
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}