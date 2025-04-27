#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemDyn(int *g_idata, int *g_odata, unsigned int n) 
{
    extern __shared__ int smem[];

    // Set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Load data into shared memory with automatic bounds checking
    if (tid < n) smem[tid] = idata[tid];
    else smem[tid] = 0; // Initialize remaining smem to zero for proper reduction
    __syncthreads();

    // Reduce in shared memory with loop to eliminate repetitive code
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) 
    {
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    // Unrolling last warp without extra volatile keyword
    if (tid < 32) 
    {
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}