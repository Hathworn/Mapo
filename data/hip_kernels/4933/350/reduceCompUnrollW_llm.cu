#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceCompUnrollW(int *g_idata, int *g_odata, unsigned int n)
{
    // Set the thread id
    unsigned int tid = threadIdx.x;
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x * 8;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8 data blocks
    int sum = 0;
    #pragma unroll
    for (int i = 0; i < 8; i++)
    {
        if (idx + i * blockDim.x < n)
        {
            sum += g_idata[idx + i * blockDim.x];
        }
    }
    idata[tid] = sum;
    __syncthreads();

    // In-place reduction with complete unroll
    if (blockDim.x >= 1024 && tid < 512) idata[tid] += idata[tid + 512];
    __syncthreads();
    if (blockDim.x >= 512 && tid < 256) idata[tid] += idata[tid + 256];
    __syncthreads();
    if (blockDim.x >= 256 && tid < 128) idata[tid] += idata[tid + 128];
    __syncthreads();
    if (blockDim.x >= 128 && tid < 64) idata[tid] += idata[tid + 64];
    __syncthreads();

    // Unrolling warp reduction
    if (tid < 32)
    {
        volatile int *vmem = idata;
        vmem[tid] += vmem[tid + 32];
        vmem[tid] += vmem[tid + 16];
        vmem[tid] += vmem[tid + 8];
        vmem[tid] += vmem[tid + 4];
        vmem[tid] += vmem[tid + 2];
        vmem[tid] += vmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        g_odata[blockIdx.x] = idata[0];
    }
}