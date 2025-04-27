#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float sharedSrc[BLOCK_DIM_X];
    
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int tIdx = threadIdx.x;
    
    // Load data into shared memory
    sharedSrc[tIdx] = src[idx];
    __syncthreads();
    
    // Perform computation using shared memory
    if (idx < SIZE) { // Boundary check to prevent out-of-bounds access
        dst[idx] = sharedSrc[tIdx] * 2.0f;
    }
}
```
