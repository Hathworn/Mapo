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

__global__ void reduce3(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + tid;
    
    // Load data from global to shared memory; check bounds
    sdata[tid] = (i < g_size) ? g_idata[i] : 0;
    __syncthreads();
    
    // Efficient reduction in shared memory using loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write block result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}