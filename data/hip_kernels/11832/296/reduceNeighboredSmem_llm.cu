#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighboredSmem(int *g_idata, int *g_odata, unsigned int  n)
{
    __shared__ int smem[DIM];

    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // boundary check
    if (idx >= n) return;

    // load data to shared memory
    smem[tid] = g_idata[idx];
    __syncthreads();

    // optimized in-place reduction with shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            smem[tid] += smem[tid + stride];
        }

        // synchronize within threadblock
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}