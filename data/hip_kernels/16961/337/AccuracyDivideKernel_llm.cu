#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to perform the division to avoid race conditions
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}