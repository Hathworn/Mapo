#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemDyn(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[];

    // Set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Set to smem by each thread
    smem[tid] = idata[tid];
    __syncthreads();

    // In-place reduction in shared memory with loop unrolling
    if (blockDim.x >= 1024) { if (tid < 512) smem[tid] += smem[tid + 512]; __syncthreads(); }
    if (blockDim.x >= 512)  { if (tid < 256) smem[tid] += smem[tid + 256]; __syncthreads(); }
    if (blockDim.x >= 256)  { if (tid < 128) smem[tid] += smem[tid + 128]; __syncthreads(); }
    if (blockDim.x >= 128)  { if (tid < 64)  smem[tid] += smem[tid + 64];  __syncthreads(); }
    
    // Unrolling warp - optimized version without volatile
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