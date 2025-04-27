#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 of block 0 to update the value
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}