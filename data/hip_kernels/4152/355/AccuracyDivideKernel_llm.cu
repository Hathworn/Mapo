#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Directly dividing accuracy using one thread to avoid race conditions
    if (threadIdx.x == 0 && blockIdx.x == 0) {  // Ensure only one thread performs division
        *accuracy /= N;
    }
}