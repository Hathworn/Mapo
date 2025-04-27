```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operations for thread-safe accuracy division
    atomicExch(accuracy, *accuracy / N);
}