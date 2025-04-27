#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Optimized thread index calculation for better readability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use a loop to process more elements when there are remaining threads
    for (; i < n; i += stride) {
        float b_val = b ? b[i] : 0.0f; // Use ternary once outside of the calculation
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val;
    }
}