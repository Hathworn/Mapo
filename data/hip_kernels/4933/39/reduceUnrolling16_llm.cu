#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling16 (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 16 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 16;

    // Unrolling 16 with bounds check
    int sum = 0;
    #pragma unroll
    for (int i = 0; i < 16; ++i)
    {
        if (idx + i * blockDim.x < n)
        {
            sum += g_idata[idx + i * blockDim.x];
        }
    }
    
    // Store the sum in the first element of the idata for further reduction
    idata[tid] = sum;
    __syncthreads();

    // In-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}