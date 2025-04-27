#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for better performance
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    if (idx == 0) { // Only first thread performs the operation
        *accuracy /= N;
    }
}