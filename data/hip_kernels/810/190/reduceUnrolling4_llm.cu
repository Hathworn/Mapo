#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling4 (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // use register to store values for unrolling
    int sum = 0;

    // unrolling 4
    if (idx + 3 * blockDim.x < n)
    {
        sum += g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
        
        // store the accumulated sum back to the original position
        idata[tid] = sum;
    }
    else
    {
        if (idx < n) sum += g_idata[idx];
        if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];
        if (idx + 2 * blockDim.x < n) sum += g_idata[idx + 2 * blockDim.x];
        if (idx + 3 * blockDim.x < n) sum += g_idata[idx + 3 * blockDim.x];
        
        idata[tid] = sum;
    }

    __syncthreads();

    // in-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // synchronize within threadblock
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}