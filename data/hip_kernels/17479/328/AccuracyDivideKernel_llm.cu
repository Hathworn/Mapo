#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to ensure accuracy is divided correctly across threads
    atomicExch(accuracy, *accuracy / N);
}