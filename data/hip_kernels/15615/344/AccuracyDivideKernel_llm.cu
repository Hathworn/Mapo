#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel to avoid potential race condition
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to safely update accuracy across threads
    atomicExch(accuracy, *accuracy / N);
}