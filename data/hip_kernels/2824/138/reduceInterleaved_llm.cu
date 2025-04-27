#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceInterleaved (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;
    
    // boundary check
    if(idx >= n) return;

    // in-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        // Unroll last warp to optimize performance
        if (blockDim.x >= 64 && tid < 32 && stride == 32)
        {
            idata[tid] += idata[tid + 32];
            idata[tid] += idata[tid + 16];
            idata[tid] += idata[tid + 8];
            idata[tid] += idata[tid + 4];
            idata[tid] += idata[tid + 2];
            idata[tid] += idata[tid + 1];
        }
        else if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }

        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}