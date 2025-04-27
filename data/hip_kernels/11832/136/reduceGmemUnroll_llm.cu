#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceGmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // unrolling 4
    int sum = 0;
    if (idx + 3 * blockDim.x < n)
    {
        sum += g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
    }
    idata[tid] = sum;
    
    __syncthreads();

    // in-place reduction in global memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            idata[tid] += idata[tid + s];
        }
        __syncthreads();
    }

    // unrolling warp
    if (tid < 32)
    {
        volatile int *vsmem = idata; // use volatile to prevent optimization issues
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