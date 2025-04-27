#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized to run divide operation in parallel by allocating one thread per task
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    if (idx == 0) { // Only the first thread performs the divide once
        *accuracy /= N;
    }
}