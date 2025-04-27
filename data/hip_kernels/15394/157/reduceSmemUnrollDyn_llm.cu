#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemUnrollDyn(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[];

    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // unrolling 4
    int tmpSum = 0;

    // Load data and sum: coalesced access, loop unrolling
    if (idx < n) {
        int a1 = g_idata[idx];
        int a2 = (idx + blockDim.x < n) ? g_idata[idx + blockDim.x] : 0;
        int a3 = (idx + 2 * blockDim.x < n) ? g_idata[idx + 2 * blockDim.x] : 0;
        int a4 = (idx + 3 * blockDim.x < n) ? g_idata[idx + 3 * blockDim.x] : 0;
        tmpSum = a1 + a2 + a3 + a4;
    }

    // store local sum into shared memory
    smem[tid] = tmpSum;
    __syncthreads();

    // in-place reduction in shared memory, handling full warp
    if (blockDim.x >= 1024) { if (tid < 512) smem[tid] += smem[tid + 512]; __syncthreads(); }
    if (blockDim.x >= 512) { if (tid < 256) smem[tid] += smem[tid + 256]; __syncthreads(); }
    if (blockDim.x >= 256) { if (tid < 128) smem[tid] += smem[tid + 128]; __syncthreads(); }
    if (blockDim.x >= 128) { if (tid < 64) smem[tid] += smem[tid + 64]; __syncthreads(); }

    // Unrolling warp-based reduction
    if (tid < 32) {
        volatile int *vsmem = smem;
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