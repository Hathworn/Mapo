#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to ensure accuracy update across multiple threads.
    atomicExch(accuracy, *accuracy / N);
}