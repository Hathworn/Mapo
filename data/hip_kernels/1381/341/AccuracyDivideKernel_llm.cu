#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Each thread gets an index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Only the first thread performs the division to avoid race conditions
    if (idx == 0) {
        *accuracy /= N;
    }
}