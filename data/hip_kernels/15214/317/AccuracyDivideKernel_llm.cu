#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Determine thread 0 in block 0 to perform division
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}