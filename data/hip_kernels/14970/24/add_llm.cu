#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void add(int *a, int *b, int *c)
{
    // Using block and thread IDs for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    c[idx] = a[idx] + b[idx];
}
```
