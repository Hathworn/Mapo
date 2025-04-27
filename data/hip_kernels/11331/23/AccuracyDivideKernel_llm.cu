#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Determine the thread unique index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure only one thread performs the division
    if(idx == 0) {
        *accuracy /= N;
    }
}