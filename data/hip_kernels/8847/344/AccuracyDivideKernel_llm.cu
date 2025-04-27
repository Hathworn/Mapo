#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block-level parallelism, assuming one element to compute
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}