#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceCompleteUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8 with boundary check optimization
    if (idx + 7 * blockDim.x < n)
    {
        int sum = 0;
        #pragma unroll
        for (int i = 0; i < 8; ++i)
        {
            sum += g_idata[idx + i * blockDim.x];
        }
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction and complete unroll
    if (blockDim.x >= 1024 && tid < 512) idata[tid] += idata[tid + 512];
    __syncthreads();

    if (blockDim.x >= 512 && tid < 256) idata[tid] += idata[tid + 256];
    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) idata[tid] += idata[tid + 128];
    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) idata[tid] += idata[tid + 64];
    __syncthreads();

    // Unrolling warp using volatile to ensure memory consistency within the warp
    if (tid < 32)
    {
        volatile int *vsmem = idata;

        // Manual unrolling of loop to minimize divergence
        if (blockDim.x >= 64) vsmem[tid] += vsmem[tid + 32];
        if (blockDim.x >= 32) vsmem[tid] += vsmem[tid + 16];
        if (blockDim.x >= 16) vsmem[tid] += vsmem[tid + 8];
        if (blockDim.x >= 8)  vsmem[tid] += vsmem[tid + 4];
        if (blockDim.x >= 4)  vsmem[tid] += vsmem[tid + 2];
        if (blockDim.x >= 2)  vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}