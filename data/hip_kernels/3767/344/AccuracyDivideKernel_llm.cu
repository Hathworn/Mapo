#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to divide accuracy by N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoiding potential race condition by using atomic operation
    atomicExch(accuracy, *accuracy / N);
}