#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void reduce(float *g_idata, float *g_odata, unsigned int n)
{
    extern __shared__ float sdata[];

    // Initial read of data from global memory to shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    float mySum = 0;

    // Loop through grid using stride to compute partial reduction
    while (i < n) {
        mySum += g_idata[i];
        if (i + blockDim.x < n) mySum += g_idata[i + blockDim.x];
        i += gridSize;
    }

    sdata[tid] = mySum; 
    __syncthreads();

    // Reduction in shared memory using unrolled loops
    if (blockDim.x >= 1024) { if (tid < 512) { sdata[tid] += sdata[tid + 512]; } __syncthreads(); } 
    if (blockDim.x >= 512) { if (tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads(); } 
    if (blockDim.x >= 256) { if (tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads(); } 
    if (blockDim.x >= 128) { if (tid <  64) { sdata[tid] += sdata[tid +  64]; } __syncthreads(); }

    // Final warp-level reduction within 64 elements, avoiding bank conflicts
    if (tid < 32) {
        volatile float* smem = sdata;
        if (blockDim.x >= 64) smem[tid] += smem[tid + 32];
        if (blockDim.x >= 32) smem[tid] += smem[tid + 16];
        if (blockDim.x >= 16) smem[tid] += smem[tid +  8];
        if (blockDim.x >=  8) smem[tid] += smem[tid +  4];
        if (blockDim.x >=  4) smem[tid] += smem[tid +  2];
        if (blockDim.x >=  2) smem[tid] += smem[tid +  1];
    }

    // Output final result for this block
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}