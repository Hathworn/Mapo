#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using threadIdx.x to ensure only one thread modifies accuracy
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}