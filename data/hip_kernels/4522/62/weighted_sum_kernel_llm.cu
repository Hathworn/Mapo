#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for efficient memory access
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        // Perform weighted sum calculation
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}