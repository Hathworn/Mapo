#include "hip/hip_runtime.h"
#include "includes.h"
#define FULL_MASK 0xffffffff

__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // static shared memory
    __shared__ int smem[DIM];

    // set thread ID
    unsigned int tid = threadIdx.x;

    // global index
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // unrolling 4 blocks
    int localSum = 0;

    if (idx + 3 * blockDim.x < n)
    {
        int a1 = g_idata[idx];
        int a2 = g_idata[idx + blockDim.x];
        int a3 = g_idata[idx + 2 * blockDim.x];
        int a4 = g_idata[idx + 3 * blockDim.x];
        localSum = a1 + a2 + a3 + a4;
    }

    smem[tid] = localSum;
    __syncthreads();

    // in-place reduction in shared memory using warp unrolling and mask
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride)
            smem[tid] += smem[tid + stride];
        __syncthreads();
    }
    
    // unrolling warp using warp shuffle
    if (tid < 32) {
        volatile int *vsmem = smem;
        for (int offset = 32; offset > 0; offset >>= 1) {
            localSum += __shfl_down_sync(FULL_MASK, localSum, offset);
        }
        vsmem[tid] = localSum;
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}