#include "hip/hip_runtime.h"
#include "includes.h"

#define subCOL 5248
#define COL 5248
#define ROW 358
#define WARPABLEROW 512
#define blocksize 256
#define subMatDim subCOL*WARPABLEROW
#define targetMatDim ROW * COL

__global__ void reduce4(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize]; // Shared memory for block-level reduction

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    // Load data from global memory with boundary check
    if (i < g_size)
    {
        sdata[tid] = g_idata[i] + ((i + blockDim.x < g_size) ? g_idata[i + blockDim.x] : 0);
    }
    else
    {
        sdata[tid] = 0;
    }
    __syncthreads();

    // Reduction within shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Ensure all threads reach this point before proceeding
    }

    // Write the result of the reduction for this block to global memory
    if (tid == 0) 
    {
        g_odata[blockIdx.x] = sdata[0];
    }
}