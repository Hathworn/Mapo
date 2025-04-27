#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block-level atomic operation to safely update the accuracy
    atomicAdd(accuracy, -*accuracy / N);
}