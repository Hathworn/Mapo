#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if thread index is valid. Only one thread needed.
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}