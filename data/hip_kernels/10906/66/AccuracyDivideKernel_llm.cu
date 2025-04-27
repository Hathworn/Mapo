#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to handle multiple accuracy elements in parallel
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and perform division
    if (idx < N) {
        accuracy[idx] /= N;
    }
}