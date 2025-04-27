#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the accuracy value into a register for faster access
    float local_accuracy = *accuracy;

    // Perform division
    local_accuracy /= N;

    // Write the result back to global memory
    *accuracy = local_accuracy;
}