#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Static shared memory
    __shared__ int smem[DIM];

    // Set thread ID and global index, 4 blocks of input data processed at a time
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Unrolling 4 blocks with boundary check
    int tmpSum = (idx + 3 * blockDim.x < n) ? g_idata[idx] + g_idata[idx + blockDim.x] +
                g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] : 0;

    smem[tid] = tmpSum;
    __syncthreads();

    // In-place reduction in shared memory
    if (blockDim.x >= 1024) { if (tid < 512) smem[tid] += smem[tid + 512]; __syncthreads(); }
    if (blockDim.x >= 512)  { if (tid < 256) smem[tid] += smem[tid + 256]; __syncthreads(); }
    if (blockDim.x >= 256)  { if (tid < 128) smem[tid] += smem[tid + 128]; __syncthreads(); }
    if (blockDim.x >= 128)  { if (tid <  64) smem[tid] += smem[tid +  64]; __syncthreads(); }

    // Unrolling warp with volatile memory
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

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}