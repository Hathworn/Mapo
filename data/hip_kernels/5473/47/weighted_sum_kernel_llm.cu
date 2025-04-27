#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the global thread index.
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop to allow handling of more elements beyond a single grid's capacity.
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Compute weighted sum.
        c[i] = s[i] * a[i] + (1.0f - s[i]) * (b ? b[i] : 0.0f);
    }
}