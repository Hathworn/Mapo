#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load value into a register to reduce global memory accesses
    float acc = *accuracy;

    // Perform division
    acc /= N;

    // Write back the result to global memory only once
    *accuracy = acc;
}