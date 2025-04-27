#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8
    if (idx + 7 * blockDim.x < n)
    {
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] + 
                  g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] + 
                  g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] + 
                  g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction and complete unroll with loop
    #pragma unroll
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1)
    {
        if (tid < offset) idata[tid] += idata[tid + offset];
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}