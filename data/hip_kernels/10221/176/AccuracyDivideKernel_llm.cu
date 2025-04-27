#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use threadIdx.x to ensure only one thread performs the division
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
    // Synchronization is not necessary due to single-thread operation
}