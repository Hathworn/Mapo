#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy(float scalar, float * x, float * y, int n)
{
    // Calculate the global index of the element to be processed
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < n) // Ensure index is within bounds
    {
        y[tid] = scalar * x[tid] + y[tid]; // Perform SAXPY operation
    }
}
```
