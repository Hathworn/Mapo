#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void reduce(float *g_idata, float *g_odata, unsigned int n)
{
    extern __shared__ float sdata[];

    // perform first level of reduction,
    // reading from global memory, writing to shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*blockDim.x*2 + threadIdx.x;
    unsigned int gridSize = blockDim.x*2*gridDim.x;

    float mySum = 0;

    // Loop unrolling and boundary check in one step
    for (; i < n; i += gridSize) {
        mySum += g_idata[i];
        if (i + blockDim.x < n) 
            mySum += g_idata[i+blockDim.x];
    }

    // each thread puts its local sum into shared memory
    sdata[tid] = mySum;
    __syncthreads();

    // do reduction in shared mem
    if (blockDim.x >= 512) { if (tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads(); }
    if (blockDim.x >= 256) { if (tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads(); }
    if (blockDim.x >= 128) { if (tid <  64) { sdata[tid] += sdata[tid +  64]; } __syncthreads(); }

    // Unroll the loop for warp-level reduction
    if (tid < 32)
    {
        volatile float* smem = sdata;
        if (blockDim.x >=  64) smem[tid] += smem[tid + 32];
        if (blockDim.x >=  32) smem[tid] += smem[tid + 16];
        if (blockDim.x >=  16) smem[tid] += smem[tid +  8];
        if (blockDim.x >=   8) smem[tid] += smem[tid +  4];
        if (blockDim.x >=   4) smem[tid] += smem[tid +  2];
        if (blockDim.x >=   2) smem[tid] += smem[tid +  1];
    }

    // write result for this block to global mem
    if (tid == 0)
        g_odata[blockIdx.x] = sdata[0];
}