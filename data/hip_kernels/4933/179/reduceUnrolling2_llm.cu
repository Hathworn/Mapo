#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling2(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID and calculate index for unrolling
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + tid;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // Unrolling 2 operations
    int temp = 0;
    if (idx + blockDim.x < n) temp = g_idata[idx + blockDim.x];
    idata[tid] = g_idata[idx] + temp;

    __syncthreads();

    // In-place reduction in shared memory using tid
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}