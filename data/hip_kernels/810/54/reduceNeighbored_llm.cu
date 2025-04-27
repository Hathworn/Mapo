#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighbored (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // boundary check
    if (idx >= n) return;

    // in-place reduction in global memory
    // Use warp shuffle to avoid shared memory and synchronization
    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        int temp = tid + stride < blockDim.x ? idata[tid + stride] : 0;
        idata[tid] += temp;

        // improve performance: avoid unnecessary synchronization in warp
        if (stride < 32) 
        {
            __syncwarp();
        } 
        else 
        {
            __syncthreads();
        }
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}