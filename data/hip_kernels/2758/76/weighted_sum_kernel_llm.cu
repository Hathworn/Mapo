#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Combine blockIdx calculations for better thread indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to process multiple elements per thread if threads are less than n
    for (int idx = i; idx < n; idx += gridDim.x * blockDim.x) {
        c[idx] = s[idx] * a[idx] + (1.0f - s[idx]) * (b ? b[idx] : 0.0f);
    }
}