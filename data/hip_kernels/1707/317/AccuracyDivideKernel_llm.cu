#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy value from global memory to a local variable
    float acc = *accuracy;

    // Divide by N
    acc /= N;

    // Store result back to global memory
    *accuracy = acc;
}