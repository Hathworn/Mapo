#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8New (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;
    
    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;
    
    // unrolling 8 with boundary check
    int tmp = 0;
    if (idx + 7 * blockDim.x < n)
    {
        #pragma unroll
        for (int i = 0; i < 8; i++)
        {
            tmp += g_idata[idx + i * blockDim.x];
        }
    }
    else
    {
        for (int i = 0; i < 8 && idx + i * blockDim.x < n; i++)
        {
            tmp += g_idata[idx + i * blockDim.x];
        }
    }

    // Write the result of the unrolled addition to the block's local memory
    idata[tid] = tmp;

    __syncthreads();

    // in-place reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        
        // synchronize within threadblock
        __syncthreads();
    }

    // write result for this block to global memory
    if (tid == 0) 
        g_odata[blockIdx.x] = idata[0];
}