#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int* c, const int* a, const int* b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (i < N) // Check to avoid out-of-bounds access
    {
        c[i] = a[i] + b[i];
    }
}
```
