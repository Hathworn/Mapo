#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoid potential race condition by using atomic operation
    if (threadIdx.x == 0) {
        atomicExch(accuracy, *accuracy / N);
    }
}