#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling4(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // Unrolling 4
    int temp_sum = 0;
    if (idx + 3 * blockDim.x < n)
    {
        temp_sum = g_idata[idx] + g_idata[idx + blockDim.x]
                 + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x];
    }
    idata[tid] = temp_sum;

    // Synchronize threads before reduction
    __syncthreads();

    // Shared memory reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Synchronize within threadblock
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}