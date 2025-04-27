#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load value from global memory
    float acc_value = *accuracy;
    // Perform division
    acc_value /= N;
    // Write back result to global memory
    *accuracy = acc_value;
}