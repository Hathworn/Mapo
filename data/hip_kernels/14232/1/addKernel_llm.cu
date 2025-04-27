#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global thread index to allow larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check array bounds to prevent potential out-of-range access
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}
```
