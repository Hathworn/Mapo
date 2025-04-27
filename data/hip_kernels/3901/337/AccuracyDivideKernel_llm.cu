#include "hip/hip_runtime.h"
#include "includes.h"

// Simplified and optimized kernel function for readability and efficiency
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if there is a single thread to perform the division safely
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N; 
    }
}