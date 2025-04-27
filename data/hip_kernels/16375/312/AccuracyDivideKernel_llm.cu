#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation for safe concurrent access to shared memory
    atomicExch(accuracy, *accuracy / N);
}