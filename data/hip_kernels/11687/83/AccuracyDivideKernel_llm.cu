#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to ensure correctness while dividing and updating the value
    atomicExch(accuracy, (*accuracy / N));
}