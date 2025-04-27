#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredGmem(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // boundary check
    if (idx >= n) return;

    // in-place reduction in global memory using shared memory to reduce global memory access
    extern __shared__ int sdata[];
    sdata[tid] = g_idata[idx];
    __syncthreads();

    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2)
    {
        if (tid % (2 * stride) == 0)
        {
            sdata[tid] += sdata[tid + stride];
        }
        // synchronize within threadblock
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}