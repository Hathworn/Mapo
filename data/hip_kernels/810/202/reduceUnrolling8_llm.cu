```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // unrolling 8
    if (idx + 7 * blockDim.x < n)
    {
        // Load 8 elements per thread and sum them
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] +
                  g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] +
                  g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] +
                  g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        idata[tid] = sum;
    } 
    else {
        idata[tid] = (idx < n) ? g_idata[idx] : 0; // Boundary check
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

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}