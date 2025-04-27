#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCuda - Java bindings for NVIDIA CUDA driver and runtime API
* http://www.jcuda.org
*
*
* This code is based on the NVIDIA 'reduction' CUDA sample,
* Copyright 1993-2010 NVIDIA Corporation.
*/

extern "C"
__global__ void reduce(double *g_idata, double *g_odata, unsigned int n)
{
    extern __shared__ double sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    double mySum = 0;

    // Loop optimization: Unroll loop for better performance
    while (i < n)
    {
        mySum += g_idata[i];
        if (i + blockDim.x < n) mySum += g_idata[i + blockDim.x];
        i += gridSize;
    }

    // Write to shared memory
    sdata[tid] = mySum;
    __syncthreads();

    // Perform reduction in shared memory
    if (blockDim.x >= 512) { if (tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads(); }
    if (blockDim.x >= 256) { if (tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads(); }
    if (blockDim.x >= 128) { if (tid <  64) { sdata[tid] += sdata[tid +  64]; } __syncthreads(); }

    // Warp shuffle optimization for threads < 32
    if (tid < 32)
    {
        volatile double* smem = sdata;
        if (blockDim.x >=  64) smem[tid] += smem[tid + 32];
        if (blockDim.x >=  32) smem[tid] += smem[tid + 16];
        if (blockDim.x >=  16) smem[tid] += smem[tid +  8];
        if (blockDim.x >=   8) smem[tid] += smem[tid +  4];
        if (blockDim.x >=   4) smem[tid] += smem[tid +  2];
        if (blockDim.x >=   2) smem[tid] += smem[tid +  1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}