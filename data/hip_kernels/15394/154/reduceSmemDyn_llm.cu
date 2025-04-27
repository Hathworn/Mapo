#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemDyn(int *g_idata, int *g_odata, unsigned int n) {
    extern __shared__ int smem[];

    // set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // load input into shared memory
    smem[tid] = (tid < n) ? idata[tid] : 0;
    __syncthreads();

    // unrolled reduction in shared memory
    if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
    __syncthreads();

    if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
    __syncthreads();

    // reduce within a single warp using warp shuffles
    if (tid < 32) {
        volatile int *vsmem = smem; // make shared memory accesses volatile
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}