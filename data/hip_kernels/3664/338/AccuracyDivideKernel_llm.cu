#include "hip/hip_runtime.h"
#include "includes.h"

// Use block/thread indexing to avoid global memory race conditions
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}