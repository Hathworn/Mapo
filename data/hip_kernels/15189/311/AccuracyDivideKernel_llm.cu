#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division with atomic operation to prevent race conditions
    atomicExch(accuracy, *accuracy / N);
}