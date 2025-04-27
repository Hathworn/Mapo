#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Process elements within bounds
    if (i < n) {
        // Use ternary operator to handle b being null directly within calculation
        c[i] = s[i] * a[i] + (1.0f - s[i]) * (b ? b[i] : 0.0f);
    }
}