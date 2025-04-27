#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check for out-of-bounds access
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}
```
