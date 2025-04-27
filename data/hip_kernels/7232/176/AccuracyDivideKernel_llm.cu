#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy into register
    float acc = *accuracy;
    // Perform division using register
    acc /= N;
    // Store the result back into global memory
    *accuracy = acc;
}