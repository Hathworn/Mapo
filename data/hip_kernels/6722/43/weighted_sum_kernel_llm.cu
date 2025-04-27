#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (i < n) {
        float b_val = b ? b[i] : 0.0f; // Use local variable for conditional
        c[i] = s[i] * a[i] + (1 - s[i]) * b_val; // Simplified expression for readability
    }
}