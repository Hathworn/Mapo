#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoid concurrent writes by using atomic operation
    atomicExch(accuracy, *accuracy / N);
}