#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst, int n)
{
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index is within the bounds
    if (idx < n) {
        dst[idx] = src[idx] * 2.0f;
    }
}
```
