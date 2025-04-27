#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using a shared memory variable to reduce repetitive global memory access
    __shared__ float local_accuracy;
    if (threadIdx.x == 0) {
        local_accuracy = *accuracy;
        local_accuracy /= N;
        *accuracy = local_accuracy;
    }
}