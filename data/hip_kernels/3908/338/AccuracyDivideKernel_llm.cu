#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operations to ensure thread safety for updating `accuracy`
    atomicExch(accuracy, *accuracy / N);
}