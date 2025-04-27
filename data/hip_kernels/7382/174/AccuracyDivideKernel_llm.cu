#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to avoid race condition, only a single division needed
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}