#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate flattened thread index
    int i = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
    if (i < n) {
        float weighted_a = s[i] * a[i]; // Precompute weighted a
        float weighted_b = (b ? s[i] * b[i] : 0); // Precompute weighted b and handle b being null
        c[i] = weighted_a + (1 - s[i]) * weighted_b; // Combine results
    }
}