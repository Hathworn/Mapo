#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void reduce(float *g_idata, float *g_odata, unsigned int n)
{
    extern __shared__ float sdata[];

    // Improved global memory access by using strided indexing
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    float mySum = 0.0f;

    // Better loop control with additional bounds check
    if (i < n) {
        mySum = g_idata[i];
        if (i + blockDim.x < n) {
            mySum += g_idata[i + blockDim.x];
        }
    }

    // Each thread puts its local sum into shared memory
    sdata[tid] = mySum;
    __syncthreads();

    // Optimize shared memory reduction using loop unrolling
    if (blockDim.x >= 1024 && tid < 512) { sdata[tid] += sdata[tid + 512]; } __syncthreads();
    if (blockDim.x >= 512 && tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads();
    if (blockDim.x >= 256 && tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads();
    if (blockDim.x >= 128 && tid < 64) { sdata[tid] += sdata[tid + 64]; } __syncthreads();

    if (tid < 32) {
        // Use warp-synchronous programming for efficiency
        volatile float* smem = sdata;
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}