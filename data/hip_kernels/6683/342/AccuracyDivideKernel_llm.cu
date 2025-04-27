#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block and thread id to ensure only the first thread performs the division
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N; // Single thread performs division
    }
}