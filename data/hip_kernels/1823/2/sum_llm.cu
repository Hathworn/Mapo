#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *a, int *b, int *c, int N)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within array bounds
    if (index < N) {
        c[index] = a[index] + b[index];
    }
}
```
