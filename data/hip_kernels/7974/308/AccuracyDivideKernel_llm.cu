#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* __restrict__ accuracy) {
    // Use atomic operation to ensure thread safety
    atomicExch(accuracy, *accuracy / N);
}