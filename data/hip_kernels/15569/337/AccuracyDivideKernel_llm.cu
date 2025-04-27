#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that only one thread performs the division for accuracy
    if (idx == 0) {
        *accuracy /= N;
    }
}