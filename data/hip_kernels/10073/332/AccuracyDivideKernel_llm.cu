#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to prevent race condition
    atomicExch(accuracy, *accuracy / N);
}