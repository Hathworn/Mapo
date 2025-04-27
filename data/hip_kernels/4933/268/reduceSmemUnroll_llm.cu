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

    // Unrolling 4 blocks with bounds check
    int localSum = 0;
    if (idx < n) localSum += g_idata[idx];
    if (idx + blockDim.x < n) localSum += g_idata[idx + blockDim.x];
    if (idx + 2 * blockDim.x < n) localSum += g_idata[idx + 2 * blockDim.x];
    if (idx + 3 * blockDim.x < n) localSum += g_idata[idx + 3 * blockDim.x];

    // Store local sum in shared memory
    smem[tid] = localSum;
    __syncthreads();

    // In-place reduction in shared memory
    if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
    __syncthreads();
    if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
    __syncthreads();
    if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
    __syncthreads();
    if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
    __syncthreads();

    // Unrolling warp reduction
    if (tid < 32)
    {
        // Avoid using volatile for the shared memory
        #pragma unroll
        for(int offset = 32; offset > 0; offset /= 2)
        {
            smem[tid] += smem[tid + offset];
        }
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}