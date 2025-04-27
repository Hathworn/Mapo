#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure single thread performs the division
    if (idx == 0) {
        *accuracy /= N;
    }
}