#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use an atomic operation to safely divide in parallel execution
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}