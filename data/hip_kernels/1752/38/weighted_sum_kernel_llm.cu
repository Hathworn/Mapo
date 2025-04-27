#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll grid manually for better utilization
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride)
    {
        // Compute weighted sum
        float b_val = b ? b[i] : 0.0f; // Conditional retrieval
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val;
    }
}