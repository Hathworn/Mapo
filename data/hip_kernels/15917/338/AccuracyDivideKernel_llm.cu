#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy value into a local variable for faster access
    float local_accuracy = *accuracy;
    
    // Perform division
    local_accuracy /= N;
    
    // Update the global memory with the computed value once
    *accuracy = local_accuracy;
}