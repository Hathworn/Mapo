#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // static shared memory
    __shared__ int smem[DIM];

    // set thread ID
    unsigned int tid = threadIdx.x;

    // global index, 4 blocks of input data processed at a time
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // unrolling 4 blocks
    int tmpSum = 0;

    // boundary check
    if (idx < n)
    {
        tmpSum = g_idata[idx];
        if (idx + blockDim.x < n) tmpSum += g_idata[idx + blockDim.x];
        if (idx + 2 * blockDim.x < n) tmpSum += g_idata[idx + 2 * blockDim.x];
        if (idx + 3 * blockDim.x < n) tmpSum += g_idata[idx + 3 * blockDim.x];
    }

    smem[tid] = tmpSum;
    __syncthreads();

    // in-place reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    // unrolling warp
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

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}