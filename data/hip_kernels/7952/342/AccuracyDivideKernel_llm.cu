#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the value of accuracy into a register
    float acc = *accuracy;
    // Perform the division in register (faster)
    acc /= N;
    // Store the result back to global memory
    *accuracy = acc;
}