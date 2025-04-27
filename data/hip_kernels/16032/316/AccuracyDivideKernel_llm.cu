#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to handle potential conflicts in multi-thread scenarios.
    atomicExch(accuracy, *accuracy / N);
}