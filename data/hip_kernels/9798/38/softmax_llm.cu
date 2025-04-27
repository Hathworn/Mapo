#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void softmax(float *g_idata, float *g_odata, unsigned int n)
{
    extern __shared__ float sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    float mySum = 0.0f;

    // Loop unrolling for improved memory coalescing
    while (i < n)
    {
        mySum += expf(g_idata[i]);
        if (i + blockDim.x < n) 
            mySum += expf(g_idata[i + blockDim.x]);
        i += gridSize;
    }

    sdata[tid] = mySum;
    __syncthreads();

    // Optimize reduction using warp shuffles for better warp utilization
    if (blockDim.x >= 512) { if (tid < 256) { sdata[tid] = mySum = mySum + sdata[tid + 256]; } __syncthreads(); }
    if (blockDim.x >= 256) { if (tid < 128) { sdata[tid] = mySum = mySum + sdata[tid + 128]; } __syncthreads(); }
    if (blockDim.x >= 128) { if (tid <  64) { sdata[tid] = mySum = mySum + sdata[tid +  64]; } __syncthreads(); }

    // Apply warp-level reduction using shuffles
    if (tid < 32)
    {
        volatile float* smem = sdata;
        if (blockDim.x >=  64) { smem[tid] = mySum = mySum + smem[tid + 32]; }
        if (blockDim.x >=  32) { smem[tid] = mySum = mySum + smem[tid + 16]; }
        if (blockDim.x >=  16) { smem[tid] = mySum = mySum + smem[tid +  8]; }
        if (blockDim.x >=   8) { smem[tid] = mySum = mySum + smem[tid +  4]; }
        if (blockDim.x >=   4) { smem[tid] = mySum = mySum + smem[tid +  2]; }
        if (blockDim.x >=   2) { smem[tid] = mySum = mySum + smem[tid +  1]; }
    }

    if (tid == 0)
        g_odata[blockIdx.x] = sdata[0];
}