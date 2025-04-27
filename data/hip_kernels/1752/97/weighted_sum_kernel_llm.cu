#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation for 1D grid
    if(i < n) {
        float s_val = s[i];                         // Pre-load s[i] into register
        float b_val = b ? b[i] : 0;                 // Pre-load b[i] into register if b is not NULL
        c[i] = s_val * a[i] + (1 - s_val) * b_val;  // Avoid repeated calculation of (1-s[i])
    }
}