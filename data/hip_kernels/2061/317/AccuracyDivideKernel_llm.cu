#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load from global to register for faster access
    float acc = *accuracy;

    // Perform division
    acc /= N;

    // Write result back to global memory
    *accuracy = acc;
}