#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredGmem(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) // Use larger stride first
    {
        if (tid < stride) // Only active threads perform addition
        {
            idata[tid] += idata[tid + stride];
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}