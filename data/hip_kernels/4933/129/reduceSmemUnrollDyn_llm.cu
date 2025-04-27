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

    if (idx + 3 * blockDim.x < n)
    {
        tmpSum = g_idata[idx] + g_idata[idx + blockDim.x] + 
                 g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x];
    }

    smem[tid] = tmpSum;
    __syncthreads();

    // perform reduction on shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    // unrolling warp
    if (tid < 32)
    {
        volatile int *vsmem = smem;  // volatile to prevent compiler reordering
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