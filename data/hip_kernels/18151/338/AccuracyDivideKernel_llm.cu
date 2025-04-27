#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load value from global memory to register
    float acc = *accuracy;

    // Perform division in register
    acc /= N;

    // Write back result from register to global memory
    *accuracy = acc;
}