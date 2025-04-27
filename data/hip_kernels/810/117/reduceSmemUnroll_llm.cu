#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Static shared memory
    __shared__ int smem[DIM];

    // Set thread ID
    unsigned int tid = threadIdx.x;

    // Global index
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Unrolling 4 blocks
    int localSum = 0;

    if (idx + 3 * blockDim.x < n)
    {
        // Prefetch global memory to registers
        float a1 = g_idata[idx];
        float a2 = g_idata[idx + blockDim.x];
        float a3 = g_idata[idx + 2 * blockDim.x];
        float a4 = g_idata[idx + 3 * blockDim.x];
        localSum = a1 + a2 + a3 + a4;
    }

    smem[tid] = localSum;
    __syncthreads();

    // In-place reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s)
        {
            smem[tid] += smem[tid + s];
        }
        __syncthreads();
    }

    // Unrolling warp
    if (tid < 32)
    {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}