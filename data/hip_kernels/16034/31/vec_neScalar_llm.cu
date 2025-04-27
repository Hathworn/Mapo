#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_neScalar(int n, double *result, double *x, double y)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread ID is within bounds
    if (id < n)
    {
        result[id] = (x[id] != y) ? 1.0 : 0.0;
    }
}
```
