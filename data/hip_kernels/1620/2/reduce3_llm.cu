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
    
    // Load elements from global to shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perfom boundary check
    if (i < g_size) {
        sdata[tid] = g_idata[i];
    } else {
        sdata[tid] = 0;
    }
    
    __syncthreads();
    
    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }
    
    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}