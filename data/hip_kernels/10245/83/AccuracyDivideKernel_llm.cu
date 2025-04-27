#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division in parallel to handle large data efficiently
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {  // Only one thread performs the division
        *accuracy /= N;
    }
}