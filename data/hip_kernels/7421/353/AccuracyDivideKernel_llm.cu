#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x to allow for multiple blocks processing different parts of accuracy
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index == 0) {
        // Ensure that only one thread performs the division
        *accuracy /= N;
    }
}