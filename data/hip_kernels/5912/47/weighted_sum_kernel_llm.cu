#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Improved 1D grid-stride loop to handle larger arrays efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        float weighted_a = s[i] * a[i];
        float weighted_b = (1 - s[i]) * (b ? b[i] : 0);
        c[i] = weighted_a + weighted_b; // Removed redundant calculations
    }
}