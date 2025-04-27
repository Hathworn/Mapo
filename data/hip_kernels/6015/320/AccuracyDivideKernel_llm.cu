#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx and threadIdx to parallelize for better performance
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *accuracy /= N;
    }
}