#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel to handle more than one element
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx and threadIdx to support parallel execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not read/write out of bounds
    if (idx < N) {
        accuracy[idx] /= N;
    }
}