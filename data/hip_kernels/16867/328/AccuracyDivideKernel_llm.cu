#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Improved code for better performance and consistency with CUDA guidelines
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx == 0) { // Ensure only the first thread executes the division
        *accuracy /= N;
    }
}