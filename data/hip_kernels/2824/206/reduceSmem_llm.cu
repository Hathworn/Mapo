#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized using shared memory access and less synchronization
__global__ void reduceSmem(int *g_idata, int *g_odata, unsigned int n) {
    __shared__ int smem[DIM];

    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < n) {
        int *idata = g_idata + blockIdx.x * blockDim.x;
        smem[tid] = idata[tid];
        __syncthreads();

        if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
        __syncthreads();
        if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
        __syncthreads();
        if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
        __syncthreads();
        if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
        __syncthreads();

        // Use warp shuffle for final accumulation within the warp
        if (tid < 32) {
            for (int offset = 32; offset > 0; offset >>= 1) {
                smem[tid] += __shfl_down(smem[tid], offset);
            }
        }

        if (tid == 0) g_odata[blockIdx.x] = smem[0];
    }
}