#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate the thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Only first thread performs division
    if (idx == 0) {
        *accuracy /= N;
    }
}