#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance
    __shared__ float sA[TILE_SIZE];
    __shared__ float sB[TILE_SIZE];

    // Load data into shared memory
    if (i < N)
    {
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
    }
    __syncthreads();

    // Ensure boundary check and perform addition
    if (i < N)
    {
        C[i] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}
```
