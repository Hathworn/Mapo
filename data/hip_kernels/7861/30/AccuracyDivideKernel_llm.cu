#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Store the initial value of accuracy in a register
    float val = *accuracy;
    
    // Perform division in the register to reduce memory operations 
    val /= N;
    
    // Write the result back to global memory
    *accuracy = val;
}