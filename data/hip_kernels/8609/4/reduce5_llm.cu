#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA runtime

// Helper functions and utilities to work with CUDA

//Standard C library

#define subCOL 5248
#define COL 5248
#define ROW 358
#define WARPABLEROW 512
#define blocksize 256
#define subMatDim subCOL*WARPABLEROW
#define targetMatDim ROW * COL
__global__ void reduce5(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize];

    // each thread loads one element from global to shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    // Load elements into shared memory safely with checks
    if (i < g_size) {
        sdata[tid] = g_idata[i] + (i + blockDim.x < g_size ? g_idata[i + blockDim.x] : 0);
    } else {
        sdata[tid] = 0;
    }
    __syncthreads();

    // Perform reduction using shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unrolled loop for last warp
    if (tid < 32) {
        volatile int *vsmem = sdata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}