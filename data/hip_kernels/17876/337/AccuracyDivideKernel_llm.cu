#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the accuracy into a register for faster access
    float acc = *accuracy;
    
    // Perform division in the register
    acc /= N;
    
    // Store the result back to memory
    *accuracy = acc;
}