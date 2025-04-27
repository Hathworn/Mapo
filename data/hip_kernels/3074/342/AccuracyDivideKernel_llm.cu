#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a single thread to divide the accuracy by N
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}