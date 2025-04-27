#include "hip/hip_runtime.h"
#include "includes.h"

// Use block and thread indexing for potential parallel execution and to handle larger N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) {  // Ensure only one thread performs the operation
        *accuracy /= N;
    }
}