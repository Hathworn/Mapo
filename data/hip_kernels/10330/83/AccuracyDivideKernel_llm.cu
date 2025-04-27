#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure single-thread execution using block and thread index check
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}