#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Add(float *a, float *b, float *c, int n)
{
    int Id = threadIdx.x + blockDim.x * blockIdx.x;

    // Only perform computation if index is within bounds
    if (Id < n) {
        c[Id] = a[Id] * b[Id];
    }
}
```
