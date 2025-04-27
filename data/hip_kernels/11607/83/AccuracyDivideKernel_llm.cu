#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate unique index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only one thread executes the division to avoid race conditions
    if (idx == 0) {
        *accuracy /= N;
    }
}