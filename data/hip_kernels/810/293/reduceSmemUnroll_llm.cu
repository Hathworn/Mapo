#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Allocate shared memory
    __shared__ int smem[DIM];

    // Calculate thread ID
    unsigned int tid = threadIdx.x;

    // Calculate global index, process 4 blocks of input data at a time
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Initialize local sum
    int tmpSum = 0;

    // Only add within boundary
    if (idx < n) tmpSum += g_idata[idx];
    if (idx + blockDim.x < n) tmpSum += g_idata[idx + blockDim.x];
    if (idx + 2 * blockDim.x < n) tmpSum += g_idata[idx + 2 * blockDim.x];
    if (idx + 3 * blockDim.x < n) tmpSum += g_idata[idx + 3 * blockDim.x];

    // Store result in shared memory
    smem[tid] = tmpSum;
    __syncthreads();

    // Perform in-place reduction within shared memory
    if (blockDim.x >= 1024) {
        if(tid < 512) smem[tid] += smem[tid + 512];
        __syncthreads();
    }

    if (blockDim.x >= 512) {
        if(tid < 256) smem[tid] += smem[tid + 256];
        __syncthreads();
    }

    if (blockDim.x >= 256) {
        if(tid < 128) smem[tid] += smem[tid + 128];
        __syncthreads();
    }

    if (blockDim.x >= 128) {
        if(tid < 64) smem[tid] += smem[tid + 64];
        __syncthreads();
    }

    // Reduce within warp using volatile
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write block result to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}