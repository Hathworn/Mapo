#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimization: Use atomic operation for potential concurrent modification
    atomicExch(accuracy, *accuracy / N);
}