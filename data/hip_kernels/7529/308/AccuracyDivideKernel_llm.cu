#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to optimize accuracy division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operations for accuracy division to handle concurrent updates safely
    atomicExch(accuracy, *accuracy / N);
}