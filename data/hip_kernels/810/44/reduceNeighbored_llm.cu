#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // boundary check
    if (idx >= n) return;

    // in-place reduction in shared memory for faster access
    extern __shared__ int smem[];
    smem[tid] = g_idata[idx];
    __syncthreads();

    // efficient reduction using shared memory
    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        if (tid % (2 * stride) == 0)
        {
            smem[tid] += smem[tid + stride];
        }
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}