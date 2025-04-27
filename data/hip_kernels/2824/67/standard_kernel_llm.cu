#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function
__global__ void standard_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    // Check if tid is zero
    if(tid == 0)
    {
        // Pre-compute the power outside the loop as it doesn't change
        float tmp = powf(a, 2.0f);

        // Avoid redundant calculations inside loop
        for (int i = 1; i < iters; i++) { /* No operation needed */ }

        // Write the result after loop
        *out = tmp;
    }
}