#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use early exit to improve efficiency
    if (i >= n) return;

    // Streamline computation by ensuring only one memory fetch per element
    float si = s[i];
    c[i] = si * a[i] + (1.0f - si) * (b ? b[i] : 0.0f);
}