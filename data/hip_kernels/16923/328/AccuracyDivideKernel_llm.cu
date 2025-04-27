#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load data into register for faster access
    float acc_val = *accuracy;
    
    // Perform division
    acc_val /= N;

    // Store result back to global memory
    *accuracy = acc_val;
}