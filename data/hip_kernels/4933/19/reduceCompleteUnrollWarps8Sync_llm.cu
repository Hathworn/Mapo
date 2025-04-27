#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8Sync(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // unrolling 8
    if (idx + 7 * blockDim.x < n)
    {
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] 
                + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] 
                + g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] 
                + g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        g_idata[idx] = sum;
    }

    __syncthreads();

    // in-place reduction and complete unroll
    if (blockDim.x >= 1024 && tid < 512) idata[tid] += idata[tid + 512];

    __syncthreads();

    if (blockDim.x >= 512 && tid < 256) idata[tid] += idata[tid + 256];

    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) idata[tid] += idata[tid + 128];

    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) idata[tid] += idata[tid + 64];

    __syncthreads();

    // unrolling warp using loop
    if (tid < 32) 
    {
        #pragma unroll
        for (int offset = 32; offset > 0; offset /= 2)
        {
            idata[tid] += idata[tid + offset];
            __syncthreads();
        }
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}