#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Get global thread index for larger arrays
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure we do not exceed array bounds
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}
```
