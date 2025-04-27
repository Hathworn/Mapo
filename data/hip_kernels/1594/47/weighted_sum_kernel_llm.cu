#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Use grid stride loop to handle large data sizes
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        // Compute result using weighted sum formula
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}