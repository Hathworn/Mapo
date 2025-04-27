#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for warp efficiency
extern "C"
__global__ void reduce_exp(double *g_idata, double *g_odata, unsigned int n)
{
    extern __shared__ double sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    double mySum = 0;

    // Accumulate sums across elements, ensuring memory bounds are respected
    while (i < n)
    {
        mySum += g_idata[i];
        if (i + blockDim.x < n)
            mySum += g_idata[i + blockDim.x];
        i += gridSize;
    }

    // Store the result in shared memory for reduction
    sdata[tid] = mySum;
    __syncthreads();

    // Reduce within shared memory to avoid global memory access
    if (blockDim.x >= 512) { if (tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads(); }
    if (blockDim.x >= 256) { if (tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads(); }
    if (blockDim.x >= 128) { if (tid <  64) { sdata[tid] += sdata[tid +  64]; } __syncthreads(); }

    // Warp-synchronous reduction for the last 64 elements
    if (tid < 32)
    {
        volatile double* smem = sdata; // Prevent incorrect compiler optimizations
        if (blockDim.x >=  64) smem[tid] += smem[tid + 32];
        if (blockDim.x >=  32) smem[tid] += smem[tid + 16];
        if (blockDim.x >=  16) smem[tid] += smem[tid +  8];
        if (blockDim.x >=   8) smem[tid] += smem[tid +  4];
        if (blockDim.x >=   4) smem[tid] += smem[tid +  2];
        if (blockDim.x >=   2) smem[tid] += smem[tid +  1];
    }

    // Write block result to global memory
    if (tid == 0)
        g_odata[blockIdx.x] = sdata[0];
}