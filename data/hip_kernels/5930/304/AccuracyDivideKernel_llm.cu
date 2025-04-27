#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoid redundant computation by using temporary variable
    float acc = *accuracy;
    acc /= N; 
    *accuracy = acc;
}