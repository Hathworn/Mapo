#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize by checking if N is not zero to prevent division by zero
    if (N != 0) {
        *accuracy /= N;
    }
}