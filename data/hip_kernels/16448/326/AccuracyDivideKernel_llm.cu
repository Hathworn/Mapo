#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread index to ensure that only one thread updates accuracy
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}