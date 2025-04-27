#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation to ensure thread safety when updating accuracy
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicExch(accuracy, *accuracy / N);
    }
}