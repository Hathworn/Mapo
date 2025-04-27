#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize the division operation by using atomic operations
    // This ensures that the accuracy is only updated once accurately by threads
    if (threadIdx.x == 0) {  // Ensure only one thread modifies the value
        atomicExch(accuracy, *accuracy / N);
    }
}