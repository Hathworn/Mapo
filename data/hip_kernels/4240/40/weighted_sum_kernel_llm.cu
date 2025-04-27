#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate linear thread index in grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (i < n)
    {
        // Compute weighted sum with b null-checking
        float b_val = (b != nullptr) ? b[i] : 0.0f;
        c[i] = s[i] * a[i] + (1 - s[i]) * b_val;
    }
}
```
