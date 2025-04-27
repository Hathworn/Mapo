#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using atomic operation for potential concurrent access
    atomicExch(accuracy, *accuracy / N);
}