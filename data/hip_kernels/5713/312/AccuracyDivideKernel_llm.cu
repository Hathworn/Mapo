#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread-safe atomic operation to divide accuracy
    atomicExch(accuracy, *accuracy / N);
}