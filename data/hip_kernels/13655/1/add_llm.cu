#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Use threadIdx and blockIdx for better indexing
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int i = COL * y + x;
    
    // Check boundary condition to avoid out-of-bounds access
    if (x < COL && y < ROW) {
        c[i] = a[i] + b[i];
    }
}
```
