#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Improved: Calculate the index of the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Improved: Ensure only the first thread performs the division
    if (idx == 0) {
        *accuracy /= N; // Improved: Perform division only once
    }
}