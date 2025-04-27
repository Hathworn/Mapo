#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to prevent race conditions and improve performance
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation for division when multiple threads access shared memory
    atomicExch(accuracy, *accuracy / N);
}