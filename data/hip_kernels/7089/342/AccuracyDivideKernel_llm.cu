#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using atomic operation to ensure thread safety and accuracy
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        atomicExch(accuracy, *accuracy / N);
    }
}