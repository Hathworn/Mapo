#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8Float (float *g_idata, float *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;
    
    // Perform unrolling for accumulations
    float sum = 0;
    if (idx + 7 * blockDim.x < n)
    {
        sum += g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
        sum += g_idata[idx + 4 * blockDim.x];
        sum += g_idata[idx + 5 * blockDim.x];
        sum += g_idata[idx + 6 * blockDim.x];
        sum += g_idata[idx + 7 * blockDim.x];
    }

    // Store sum in shared memory
    __shared__ float sdata[1024];
    sdata[tid] = sum;
    __syncthreads();
    
    // In-place reduction using complete unrolling
    if (blockDim.x >= 1024 && tid < 512) sdata[tid] += sdata[tid + 512];
    __syncthreads();
    if (blockDim.x >= 512 && tid < 256) sdata[tid] += sdata[tid + 256];
    __syncthreads();
    if (blockDim.x >= 256 && tid < 128) sdata[tid] += sdata[tid + 128];
    __syncthreads();
    if (blockDim.x >= 128 && tid < 64) sdata[tid] += sdata[tid + 64];
    __syncthreads();

    // Unrolling warp
    if (tid < 32)
    {
        volatile float *vsmem = sdata; // Use volatile to avoid compiler optimizations
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}