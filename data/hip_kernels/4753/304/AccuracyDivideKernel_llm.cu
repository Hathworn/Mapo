#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for dividing accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (idx == 0) { // Only one thread performs the division to avoid race condition
        *accuracy /= N;
    }
}