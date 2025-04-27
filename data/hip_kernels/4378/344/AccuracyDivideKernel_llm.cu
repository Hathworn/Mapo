#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Fetch accuracy into a register to reduce global memory access
    float acc = *accuracy;
    
    // Perform division using fdividef for better performance
    acc = fdividef(acc, N);
    
    // Write the result back to global memory
    *accuracy = acc;
}