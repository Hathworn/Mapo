#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum to zero
    float totalSum = 0.0f;

    // Perform accumulation
    for (int k = 0; k < n; ++k) {
        totalSum += x[k * groups + i];
    }

    // Write result to global memory
    sum[i] = totalSum;
}