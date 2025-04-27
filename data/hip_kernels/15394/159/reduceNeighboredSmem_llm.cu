```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighboredSmem(int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];

    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (idx >= n) return;

    // Load data to shared memory
    smem[tid] = g_idata[idx];
    __syncthreads();

    // In-place reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            smem[tid] += smem[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}