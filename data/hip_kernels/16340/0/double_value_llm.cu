#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void double_value(double *x, double *y)
{
    // Use blockIdx and blockDim for scalable indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    y[idx] = 2.0 * x[idx];
}
```
