#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void triad(float* __restrict__ A, float* __restrict__ B, float* __restrict__ C, float s)
{
    int gid = threadIdx.x + (blockIdx.x * blockDim.x);

    // Check if gid is within bounds before performing operations
    if (gid < blockDim.x * gridDim.x)
    {
        // Perform computation using registers to minimize memory access latency
        float a_val = A[gid];
        float b_val = B[gid];

        C[gid] = a_val + s * b_val;
    }
}