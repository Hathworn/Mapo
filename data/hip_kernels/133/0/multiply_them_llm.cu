#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiply_them(float *dest, float *a, float *b)
{
    // Calculate global thread index for larger data handling
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Safety check: Ensure we don't exceed array bounds
    if (idx < N)  // N should be the size of the arrays
    {
        dest[idx] = a[idx] * b[idx];
    }
}
```
