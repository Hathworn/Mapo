#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighboredLess (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // boundary check
    if(idx >= n) return;

    // in-place reduction in shared memory for better performance
    __shared__ int sdata[1024]; // assuming maximum blockDim.x is 1024
    sdata[tid] = idata[tid];
    __syncthreads();

    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        // convert tid into local array index
        int index = 2 * stride * tid;

        if (index < blockDim.x)
        {
            sdata[index] += sdata[index + stride];
        }

        // synchronize within threadblock
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sdata[0]; // accumulate result from shared memory
}