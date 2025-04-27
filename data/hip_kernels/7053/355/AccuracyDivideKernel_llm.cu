#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if the thread is the first one
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        // Perform division in the first thread of the first block
        *accuracy /= N;
    }
}