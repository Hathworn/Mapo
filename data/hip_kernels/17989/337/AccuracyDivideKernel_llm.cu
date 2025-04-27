#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the value into a register for faster access
    float acc_val = *accuracy; 
    // Perform the division
    acc_val /= N; 
    // Store the result back in global memory
    *accuracy = acc_val; 
}