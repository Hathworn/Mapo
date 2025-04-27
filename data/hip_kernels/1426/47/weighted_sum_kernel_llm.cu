#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Optimize index calculation and memory coalescing
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    if (i < n) {
        float b_val = b ? b[i] : 0.0f; // Minimize branching
        c[i] = fmaf(s[i], a[i], (1.0f - s[i]) * b_val); // Use fmaf for fused multiply-add
    }
}