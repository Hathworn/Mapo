#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // unroll 2
    int sum = 0;
    if (idx < n) {
        sum = g_idata[idx];
        if (idx + blockDim.x < n) {
            sum += g_idata[idx + blockDim.x];
        }
    }
    __syncthreads();

    // in-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (tid < stride)
        {
            sum += __shfl_down_sync(0xFFFFFFFF, sum, stride);
        }
        __syncthreads();
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sum;
}