#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrollWarps(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // Load data into shared memory
    __shared__ int sdata[1024]; // Assume blockDim.x <= 1024
    if (idx < n) {
        sdata[tid] = g_idata[idx] + (idx + blockDim.x < n ? g_idata[idx + blockDim.x] : 0);
    } else {
        sdata[tid] = 0;
    }
    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1)
    {
        if (tid < stride)
        {
            sdata[tid] += sdata[tid + stride];
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Unrolling last warp
    if (tid < 32)
    {
        volatile int *vsmem = sdata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}