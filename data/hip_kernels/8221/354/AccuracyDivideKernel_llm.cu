#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Efficient division using reciprocal
    float reciprocal = 1.0f / static_cast<float>(N);
    *accuracy *= reciprocal;
}