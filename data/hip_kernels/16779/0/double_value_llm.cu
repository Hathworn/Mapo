#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Use blockIdx.x and blockDim.x for wider parallel execution
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    y[idx] = 2.0 * x[idx]; // Avoid recomputing index; use '2.0' for clarity
}
```
