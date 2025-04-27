#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n)
{
    // Calculate global and local thread index
    unsigned int tid = threadIdx.x;
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // Perform initial contribution to local memory to ensure coalesced access
    if (idx < n) idata[tid] = g_idata[idx]; 
    __syncthreads();

    // In-place reduction in shared (local) memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0)
    {
        g_odata[blockIdx.x] = idata[0];
    }
}