#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the accuracy value into a register to reduce global memory access
    float acc = *accuracy;
    
    // Perform the division using a register
    acc /= N;
    
    // Write the result back to global memory
    *accuracy = acc;
}