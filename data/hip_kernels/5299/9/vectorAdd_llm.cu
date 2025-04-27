#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate unique thread index for this kernel
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform operation only if within bounds
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}
```
