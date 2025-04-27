#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoid redundant global memory access by using a register
    float acc = *accuracy;  
    acc /= N;  // Perform division in register
    *accuracy = acc;  // Write back result to global memory
}