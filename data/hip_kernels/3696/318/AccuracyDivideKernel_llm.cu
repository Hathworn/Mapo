#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Efficiently divide accuracy by N using parallel reduction
    accuracy[threadIdx.x] /= N; // Thread index used for independent divisions
}