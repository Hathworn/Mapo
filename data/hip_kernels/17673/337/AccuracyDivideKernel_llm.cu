#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using a single thread to perform division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}