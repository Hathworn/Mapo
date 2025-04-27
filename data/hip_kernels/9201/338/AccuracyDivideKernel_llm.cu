#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use local variable to reduce global memory accesses
    float acc = *accuracy;
    acc /= N;
    *accuracy = acc;
}