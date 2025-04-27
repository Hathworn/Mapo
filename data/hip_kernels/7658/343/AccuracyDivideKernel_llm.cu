```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure valid input
    if (N == 0) return; 

    // Simplified access to global memory
    atomicExch(accuracy, (*accuracy) / N); 
}