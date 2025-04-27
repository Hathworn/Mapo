#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceGmem(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    // Optimize in-place reduction using unrolling
    if (blockDim.x >= 1024)
    {
        if (tid < 512) idata[tid] += idata[tid + 512];
        __syncthreads();
    }
    
    if (blockDim.x >= 512)
    {
        if (tid < 256) idata[tid] += idata[tid + 256];
        __syncthreads();
    }
    
    if (blockDim.x >= 256)
    {
        if (tid < 128) idata[tid] += idata[tid + 128];
        __syncthreads();
    }
    
    if (blockDim.x >= 128)
    {
        if (tid < 64) idata[tid] += idata[tid + 64];
        __syncthreads();
    }

    // Unrolling warp without volatile (combined stages)
    if (tid < 32)
    {
        idata[tid] += idata[tid + 32];
        idata[tid] += idata[tid + 16];
        idata[tid] += idata[tid + 8];
        idata[tid] += idata[tid + 4];
        idata[tid] += idata[tid + 2];
        idata[tid] += idata[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}