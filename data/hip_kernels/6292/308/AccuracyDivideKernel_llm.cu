#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Only perform division once by a single thread to prevent race conditions
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}