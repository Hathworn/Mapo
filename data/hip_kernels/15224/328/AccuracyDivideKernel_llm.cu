#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Each thread updates a separate element in accuracy (assuming multiple elements)
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) {
        *accuracy /= N; // Ensure only one thread performs the division
    }
}