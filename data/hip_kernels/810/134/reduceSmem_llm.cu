#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmem(int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];

    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    int *idata = g_idata + blockIdx.x * blockDim.x;
    smem[tid] = idata[tid];
    __syncthreads();

    // Loop unrolling and combined reductions to reduce syncthreads
    if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
    __syncthreads();
    
    if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
    __syncthreads();

    // Unroll last warp using thread divergence avoidance
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        __syncthreads();
        
        vsmem[tid] += vsmem[tid + 16];
        __syncthreads();
        
        vsmem[tid] += vsmem[tid + 8];
        __syncthreads();
        
        vsmem[tid] += vsmem[tid + 4];
        __syncthreads();
        
        vsmem[tid] += vsmem[tid + 2];
        __syncthreads();
        
        vsmem[tid] += vsmem[tid + 1];
        __syncthreads();
    }

    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}