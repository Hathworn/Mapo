#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with direct division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x to ensure only one division operation is performed
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}