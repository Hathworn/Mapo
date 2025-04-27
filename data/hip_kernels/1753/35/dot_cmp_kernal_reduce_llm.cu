#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_cmp_kernal_reduce(float *g_idata1, float *g_idata2, float *g_odata)
{
    extern __shared__ float sdata[];

    // Load data from global to shared mem with optimized coalesced access
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * (blockDim.x * 2) + tid;
    
    float sum = 0.0f;
    if (idx < blockDim.x * gridDim.x) {
        // Combine two load operations and avoid out of bounds access
        sum = g_idata1[idx] * g_idata2[idx] + g_idata1[idx + blockDim.x] * g_idata2[idx + blockDim.x];
    }
    sdata[tid] = sum;
    __syncthreads();

    // Unroll the last warp for better performance
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Warp unrolling for last 32 threads
    if (tid < 32) {
        if (blockDim.x >= 64) sdata[tid] += sdata[tid + 32];
        if (blockDim.x >= 32) sdata[tid] += sdata[tid + 16];
        if (blockDim.x >= 16) sdata[tid] += sdata[tid + 8];
        if (blockDim.x >= 8) sdata[tid] += sdata[tid + 4];
        if (blockDim.x >= 4) sdata[tid] += sdata[tid + 2];
        if (blockDim.x >= 2) sdata[tid] += sdata[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}