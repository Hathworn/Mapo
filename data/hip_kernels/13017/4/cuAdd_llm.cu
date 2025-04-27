#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized version of the cuAdd kernel function
__global__ void cuAdd(int *a, int *b, int *c, int N)
{
    // Calculate global index using grid-stride loop for improved occupancy
    for(int offset = blockDim.x * blockIdx.x + threadIdx.x; offset < N; offset += blockDim.x * gridDim.x)
    {
        c[offset] = a[offset] + b[offset];
    }
}