#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemUnrollDyn(int *g_idata, int *g_odata, unsigned int n) {
    extern __shared__ int smem[];

    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // unrolling 4
    int tmpSum = (idx + 3 * blockDim.x < n) ? g_idata[idx] + g_idata[idx + blockDim.x] + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] : 0;

    smem[tid] = tmpSum;
    __syncthreads();

    // in-place reduction in shared memory
    if (blockDim.x >= 1024 && tid < 512) smem[tid] += smem[tid + 512];
    __syncthreads();

    if (blockDim.x >= 512 && tid < 256) smem[tid] += smem[tid + 256];
    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) smem[tid] += smem[tid + 128];
    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) smem[tid] += smem[tid + 64];
    __syncthreads();

    // unrolling warp
    if (tid < 32) {
        // Use volatile pointer to ensure compiler doesn't optimize away memory accesses
        volatile int *vsmem = smem;
        // Warp synchronous reduction using loop
        for (int i = 32; i > 0; i >>= 1) {
            vsmem[tid] += vsmem[tid + i];
        }
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}