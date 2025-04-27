#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Static shared memory
    __shared__ int smem[DIM];

    // Set thread ID
    unsigned int tid = threadIdx.x;

    // Global index, 4 blocks of input data processed at a time
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Unrolling 4 blocks
    int tmpSum = 0;

    // Boundary check and sum up unrolled data
    if (idx < n) tmpSum = g_idata[idx] 
                       + ((idx + blockDim.x < n) ? g_idata[idx + blockDim.x] : 0)
                       + ((idx + 2 * blockDim.x < n) ? g_idata[idx + 2 * blockDim.x] : 0)
                       + ((idx + 3 * blockDim.x < n) ? g_idata[idx + 3 * blockDim.x] : 0);

    smem[tid] = tmpSum;
    __syncthreads();

    // In-place reduction in shared memory with loop unrolling
    #pragma unroll
    for (int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    // Unrolling last warp without __syncthreads
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}