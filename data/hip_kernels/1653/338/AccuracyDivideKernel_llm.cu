#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel to use grid-stride loop
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate the index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Allow multiple threads to work on large arrays
    for (int i = idx; i < 1; i += stride) {
        accuracy[i] /= N;
    }
}