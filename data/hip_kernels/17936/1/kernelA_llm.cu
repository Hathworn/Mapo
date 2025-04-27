#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global index for current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (i < size) {
        r[i] = x[i] * y[i] + z[i];
    }
}
```
