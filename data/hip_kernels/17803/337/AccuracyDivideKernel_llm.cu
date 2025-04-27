#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we only modify the intended element when using multiple threads
    if (idx == 0) {
        *accuracy /= N;
    }
}