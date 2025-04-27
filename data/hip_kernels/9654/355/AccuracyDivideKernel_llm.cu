#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy into a register to minimize memory accesses
    float acc = *accuracy;
    // Perform the division
    acc /= N;
    // Store the result back to global memory
    *accuracy = acc;
}