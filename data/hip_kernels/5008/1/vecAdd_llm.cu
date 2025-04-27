#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(int *a, int *b, int *c, int n) // Pass array size as parameter
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if(index < n) // Use parameter passed for bounds checking
    {
        c[index] = a[index] + b[index];
    }
}
```
