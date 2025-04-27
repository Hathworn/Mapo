#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA runtime

// Helper functions and utilities to work with CUDA

//Standard C library

#define subCOL 5248
#define COL 5248
#define ROW 358
#define WARPABLEROW 512
#define blocksize 256
#define subMatDim subCOL*WARPABLEROW
#define targetMatDim ROW * COL

__global__ void reduce4(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    
    // Use conditional to prevent out of bounds access
    if (i < g_size)
    {
        int sum = g_idata[i];
        if (i + blockDim.x < g_size) sum += g_idata[i + blockDim.x];
        
        sdata[tid] = sum;
    }
    else
    {
        sdata[tid] = 0;
    }
    
    __syncthreads();

    // Optimized reduction using loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unroll the last warp
    if (tid < 32)
    {
        volatile int *smem = sdata; 
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}