#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index in 1D array
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Process only if within bounds
    if(i < n) {
        // Use ternary operator to avoid branching
        float b_value = b ? b[i] : 0;
        c[i] = s[i] * a[i] + (1 - s[i]) * b_value;
    }
}