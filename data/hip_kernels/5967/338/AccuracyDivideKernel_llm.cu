#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load and store accuracy value using temporary variable to improve memory access efficiency
    float temp_accuracy = *accuracy;
    temp_accuracy /= N;
    *accuracy = temp_accuracy;
}