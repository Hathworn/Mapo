#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize thread blocks to allow parallel execution
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (idx == 0) { // Ensure only one thread performs the division
        *accuracy /= N;
    }
}