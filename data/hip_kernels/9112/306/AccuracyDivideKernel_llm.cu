#include "hip/hip_runtime.h" 
#include "includes.h"

// Optimize the kernel by using grid-stride loop to handle more data if needed
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx == 0) { // Only the first thread in the grid carries out the division
        *accuracy /= N;
    }
}