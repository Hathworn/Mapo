#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index considering the block
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition if within bounds
    if (i < MAX_SIZE) {
        c[i] = a[i] + b[i];
    }
}
```
