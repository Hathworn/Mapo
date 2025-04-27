#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread index '0' to avoid potential race condition
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}