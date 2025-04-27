#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x as an index to allow kernel execution on multiple elements
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index == 0) {
        // Only the first thread performs the division to prevent race conditions
        *accuracy /= N;
    }
}