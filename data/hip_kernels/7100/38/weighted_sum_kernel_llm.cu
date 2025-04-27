#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds and coalesce b's optional handling
    if (i < n)
    {
        float b_value = b ? b[i] : 0.0f;
        c[i] = s[i] * a[i] + (1 - s[i]) * b_value;
    }
}