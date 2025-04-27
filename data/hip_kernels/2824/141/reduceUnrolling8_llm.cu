```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling8 (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8
    int sum = 0;
    if (idx + 7 * blockDim.x < n)
    {
        // Use a loop to reduce redundant code
        #pragma unroll
        for (int i = 0; i < 8; i++)
        {
            sum += g_idata[idx + i * blockDim.x];
        }
        g_idata[idx] = sum;  // Store the sum to the first index
    }

    __syncthreads();

    // In-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride) 
        {
            idata[tid] += idata[tid + stride];  // Combine results within a block
        }
        __syncthreads();  // Synchronize within threadblock
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}