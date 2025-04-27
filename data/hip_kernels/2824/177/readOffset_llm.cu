#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Pre-calculate offset index to avoid redundant computation
    if (i + offset < n) {
        unsigned int k = i + offset;
        C[i] = A[k] + B[k];
    }
}
```
