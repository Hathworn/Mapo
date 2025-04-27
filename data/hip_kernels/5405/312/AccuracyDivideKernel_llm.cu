#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division in parallel using multiple threads
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid == 0) {  // Only first thread performs the division
        *accuracy /= N;
    }
    // Optional: Add __syncthreads() if further synchronization is needed
}