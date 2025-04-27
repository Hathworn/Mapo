#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate blockDim-based unique thread index in the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform division only if unique thread index is zero
    if (idx == 0) {
        *accuracy /= N;
    }
}