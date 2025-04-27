#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Initialize thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Only thread 0 performs the division to avoid race conditions
    if (idx == 0) {
        *accuracy /= N;
    }
}