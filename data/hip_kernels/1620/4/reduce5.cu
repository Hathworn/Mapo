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
__global__ void reduce5(int *g_idata, int *g_odata, int g_size)
{
__shared__ int sdata[blocksize];
// each thread loads one element from global to shared mem
unsigned int tid = threadIdx.x;
unsigned int i = blockIdx.x*(blockDim.x * 2) + threadIdx.x;
sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];
__syncthreads();
// do reduction in shared mem
for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
{
if (tid < s)
{
sdata[tid] += sdata[tid + s];
}

__syncthreads();
}
if (tid < 32)
{
sdata[tid] += sdata[tid + 32];
sdata[tid] += sdata[tid + 16];
sdata[tid] += sdata[tid + 8];
sdata[tid] += sdata[tid + 4];
sdata[tid] += sdata[tid + 2];
sdata[tid] += sdata[tid + 1];
}
// write result for this block to global mem
if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}