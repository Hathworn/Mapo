#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceCompleteUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // unrolling 8 with boundary check
    if (idx + 7 * blockDim.x < n)
    {
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x]
                + g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] + g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        idata[tid] = sum;  // Store the sum in shared memory
    }

    __syncthreads();

    // unrolled and optimized reduction using warp shuffle
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            idata[tid] += idata[tid + s];
        }
        __syncthreads();
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}