#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _gather(const float * input, const int * indices, float * output, const int n)
{
    // Use a local variable to avoid repeated calculations
    const int tid = threadIdx.x + blockDim.x * blockIdx.x;

    if (tid < n) {
        // Calculate index once
        int baseIndex = (tid / 6) * 6;
        output[tid] = input[(tid % 6) + baseIndex + indices[tid / 6] * 6];
    }
}