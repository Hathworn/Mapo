#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a thread-safe atomic operation to prevent race conditions
    atomicAdd(accuracy, *accuracy / N);
}