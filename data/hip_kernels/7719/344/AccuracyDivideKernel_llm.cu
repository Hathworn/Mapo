#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy from global memory to a register for efficiency
    float acc = *accuracy;
    
    // Perform division
    acc /= N;
    
    // Store the result back to global memory
    *accuracy = acc;
}