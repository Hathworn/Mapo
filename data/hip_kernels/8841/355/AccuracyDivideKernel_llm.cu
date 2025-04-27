#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to optimize division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check boundary condition in case of multiple blocks/threads
    if(threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}