#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceGmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // unrolling 4 with boundary checks
    if (idx < n)
    {
        int sum = 0;
        if (idx < n) sum += g_idata[idx];
        if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];
        if (idx + 2 * blockDim.x < n) sum += g_idata[idx + 2 * blockDim.x];
        if (idx + 3 * blockDim.x < n) sum += g_idata[idx + 3 * blockDim.x];
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction using loop for better readability
    for(int offset = blockDim.x / 2; offset > 32; offset /= 2) 
    {
        if (tid < offset)
            idata[tid] += idata[tid + offset];
        __syncthreads();
    }

    // Unrolling warp
    if (tid < 32)
    {
        volatile int *vsmem = idata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}