#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
// static shared memory
__shared__ int smem[DIM];

// set thread ID
unsigned int tid = threadIdx.x;

// global index
unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

// unrolling 4 blocks
int localSum = 0;

if (idx + 3 * blockDim.x < n)
{
float a1 = g_idata[idx];
float a2 = g_idata[idx + blockDim.x];
float a3 = g_idata[idx + 2 * blockDim.x];
float a4 = g_idata[idx + 3 * blockDim.x];
localSum = a1 + a2 + a3 + a4;
}

smem[tid] = localSum;
__syncthreads();

// in-place reduction in shared memory
if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
__syncthreads();
if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
__syncthreads();
if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
__syncthreads();
if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
__syncthreads();

// unrolling warp
if (tid < 32)
{
volatile int *vsmem = smem;
vsmem[tid] += vsmem[tid + 32];
vsmem[tid] += vsmem[tid + 16];
vsmem[tid] += vsmem[tid +  8];
vsmem[tid] += vsmem[tid +  4];
vsmem[tid] += vsmem[tid +  2];
vsmem[tid] += vsmem[tid +  1];
}

// write result for this block to global mem
if (tid == 0) g_odata[blockIdx.x] = smem[0];
}