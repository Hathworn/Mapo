#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemDyn(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[];

    // set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // set to smem by each thread
    smem[tid] = (tid < n) ? idata[tid] : 0;  // Ensure out-of-bounds threads don't access g_idata
    __syncthreads();

    // in-place reduction using loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            smem[tid] += smem[tid + s];
        }
        __syncthreads();
    }

    // unrolling warp, no __syncthreads() needed within a warp
    if (tid < 32) {
        volatile int *vsmem = smem;  // Ensure compiler doesn't reorder memory operations
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}