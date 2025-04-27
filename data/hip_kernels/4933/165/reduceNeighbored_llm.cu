```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (idx >= n) return;

    // Convert global data pointer to the local pointer of this block
    extern __shared__ int sdata[];
    sdata[tid] = g_idata[idx];

    // Synchronize within threadblock to ensure all loads are complete
    __syncthreads();

    // In-place reduction in shared memory for better performance
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            sdata[tid] += sdata[tid + stride];
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}