#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread ID to avoid repeated division in a parallel environment
    int idx = threadIdx.x;
    if (idx == 0) {
        *accuracy /= N;
    }
}