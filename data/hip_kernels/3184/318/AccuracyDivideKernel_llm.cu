#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load the value into a register for better performance
    float local_accuracy = *accuracy;
    
    // Perform division; use fast math if applicable
    local_accuracy /= N;
    
    // Write result back to global memory
    *accuracy = local_accuracy;
}