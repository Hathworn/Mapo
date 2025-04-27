#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrollWarps (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // unrolling 2
    if (idx + blockDim.x < n) g_idata[idx] += g_idata[idx + blockDim.x];
    
    __syncthreads();

    // in-place reduction in global memory
    for (int stride = blockDim.x >> 1; stride > 32; stride >>= 1)
    {
        if (tid < stride)
        {
            // Simplified index
            idata[tid] += idata[tid + stride];
        }

        // synchronize within threadblock
        __syncthreads();
    }

    // unrolling last warp
    if (tid < 32)
    {
        volatile int *vsmem = idata;
        // Use single loop for warp unrolling, reduces code repetition
        for (int step = 32; step >= 1; step >>= 1)
            vsmem[tid] += vsmem[tid + step];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}