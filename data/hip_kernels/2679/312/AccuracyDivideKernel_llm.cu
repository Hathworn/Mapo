#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to launch fewer threads, using a single atomic operation
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) { // Ensure only one thread performs the division
        atomicExch(accuracy, *accuracy / N); // Use atomic operation to prevent race condition
    }
}