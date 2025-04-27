```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load *accuracy into a register for faster access
    float local_accuracy = *accuracy;

    // Perform division
    local_accuracy /= N;

    // Write back the result to global memory
    *accuracy = local_accuracy;
}