#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the accuracy value from global memory into a register
    float accValue = *accuracy;
    
    // Perform the division in register for faster operation
    accValue /= N;
    
    // Store the result back to global memory
    *accuracy = accValue;
}