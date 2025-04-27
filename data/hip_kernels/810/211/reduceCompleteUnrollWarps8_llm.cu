#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // unrolling 8
    if (idx + 7 * blockDim.x < n)
    {
        // Load values and reduce directly
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x]
                + g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] + g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        idata[tid] = sum; // Store the reduction result in shared memory
    }
    else {
        idata[tid] = 0; // Ensure all threads initialize their positions
    }

    __syncthreads();

    // Reduce in shared memory
    if (blockDim.x >= 1024 && tid < 512) idata[tid] += idata[tid + 512];
    __syncthreads();

    if (blockDim.x >= 512 && tid < 256) idata[tid] += idata[tid + 256];
    __syncthreads();

    if (blockDim.x >= 256 && tid < 128) idata[tid] += idata[tid + 128];
    __syncthreads();

    if (blockDim.x >= 128 && tid < 64) idata[tid] += idata[tid + 64];
    __syncthreads();

    // Unrolling warp
    if (tid < 32)
    {
        volatile int *vsmem = idata; // Use volatile pointer for warp-level reduction
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}