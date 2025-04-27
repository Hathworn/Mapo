#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Optimize index calculation for better performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Guard with stride to cover full range of n
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}