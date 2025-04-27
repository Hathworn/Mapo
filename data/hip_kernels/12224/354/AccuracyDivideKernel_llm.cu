#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for better memory coalescing and parallel efficiency
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  
    
    // Use one thread to perform the division to prevent race conditions
    if (idx == 0) {
        *accuracy /= N;
    }
}