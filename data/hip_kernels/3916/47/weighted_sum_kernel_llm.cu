#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better utilization of GPU resources
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        c[idx] = s[idx] * a[idx] + (1.0f - s[idx]) * (b ? b[idx] : 0.0f);
    }
}