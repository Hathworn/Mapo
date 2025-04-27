#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void add(const float* __restrict__ x1, const float* __restrict__ x2, float* __restrict__ y, unsigned int len) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure tid is within range to avoid invalid memory access
    if (tid < len) {
        // Perform addition
        y[tid] = x1[tid] + x2[tid];
    }
}