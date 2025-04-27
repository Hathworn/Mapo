#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy into register for faster access
    float acc = *accuracy;

    // Divide in register
    acc /= N;

    // Write back to global memory
    *accuracy = acc;
}