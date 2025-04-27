#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // exit if thread index is beyond the range
    if (idx >= n) return;

    // optimize: load data into shared memory to minimize global memory access
    extern __shared__ int sdata[];
    sdata[tid] = g_idata[idx];
    __syncthreads();

    // in-place reduction in shared memory
    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        if (tid % (2 * stride) == 0)
        {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads(); // synchronize within threadblock
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}