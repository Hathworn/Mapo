#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8: check boundary once and perform reduction
    if (idx + 7 * blockDim.x < n)
    {
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] +
                  g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] +
                  g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] +
                  g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();  // synchronize within threadblock
    }

    // Unrolling final 32 threads
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
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}