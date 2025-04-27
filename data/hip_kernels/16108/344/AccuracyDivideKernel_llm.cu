#include "hip/hip_runtime.h"
#include "includes.h"
// Optimized kernel to prevent race conditions using atomic operations
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) {  // Single thread performs division
        atomicExch(accuracy, *accuracy / N);
    }
}