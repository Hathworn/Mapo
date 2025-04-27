#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block and thread index to ensure each thread processes one element if required
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *accuracy /= N;  // Only one thread performs the division
    }
}