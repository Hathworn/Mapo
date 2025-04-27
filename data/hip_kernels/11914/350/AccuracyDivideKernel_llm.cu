#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use an atomic operation to ensure thread-safe access to the accuracy variable
    if (threadIdx.x == 0) {
        atomicExch(accuracy, *accuracy / N);
    }
}