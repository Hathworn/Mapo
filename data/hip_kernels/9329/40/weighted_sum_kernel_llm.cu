#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure thread is operating within bounds
    if(i < n)
    {
        // Calculate weighted sum
        c[i] = s[i] * a[i] + (1.0f - s[i]) * (b ? b[i] : 0.0f);
    }
}