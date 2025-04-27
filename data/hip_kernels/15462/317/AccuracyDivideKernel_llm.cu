#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Create a temporary variable to prevent global memory write conflicts
    float temp_accuracy = *accuracy; 
    temp_accuracy /= N;
    *accuracy = temp_accuracy; // Update the original value after computation
}