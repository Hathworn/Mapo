#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle more data with fewer threads
    for (; i < n; i += blockDim.x * gridDim.x) {
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}