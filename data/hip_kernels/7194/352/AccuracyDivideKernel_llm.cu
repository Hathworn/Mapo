#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function for performance
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy into register for faster access
    float acc = *accuracy;
    
    // Perform division
    acc /= N;
    
    // Store result back to global memory
    *accuracy = acc;
}