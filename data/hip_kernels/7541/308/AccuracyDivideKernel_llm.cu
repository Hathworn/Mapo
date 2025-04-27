#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division using device function to avoid race condition
    atomicExch(accuracy, *accuracy / N);
}