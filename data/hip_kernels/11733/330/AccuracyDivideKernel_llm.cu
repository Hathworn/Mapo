#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Efficient division using reciprocal
    const float reciprocal_N = 1.0f / N;
    *accuracy *= reciprocal_N;
}