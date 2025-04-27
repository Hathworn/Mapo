#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to safely update shared accuracy variable across threads
    atomicExch(accuracy, *accuracy / N);
}