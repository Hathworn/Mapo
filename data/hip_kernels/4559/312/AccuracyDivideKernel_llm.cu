#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only one thread performs the division to avoid race condition
    if (index == 0) {
        *accuracy /= N;
    }
}