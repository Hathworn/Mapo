#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrollWarp8(int *g_idata, int *g_odata, unsigned int n)
{
    // Set the thread id.
    unsigned int tid = threadIdx.x;
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x * 8;
    
    // Convert global data pointer to the local pointer of this block.
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8 data blocks.
    int sum = 0;
    if (idx + blockDim.x * 7 < n)
    {
        sum += g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + blockDim.x * 2];
        sum += g_idata[idx + blockDim.x * 3];
        sum += g_idata[idx + blockDim.x * 4];
        sum += g_idata[idx + blockDim.x * 5];
        sum += g_idata[idx + blockDim.x * 6];
        sum += g_idata[idx + blockDim.x * 7];
    }
    idata[tid] = sum;
    __syncthreads();

    // In-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        // Synchronize within threadblock.
        __syncthreads();
    }

    // Unrolling warp
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

    // Write result for this block to global mem.
    if (tid == 0)
    {
        g_odata[blockIdx.x] = idata[0];
    }
}