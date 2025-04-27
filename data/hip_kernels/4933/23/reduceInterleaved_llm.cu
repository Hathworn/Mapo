#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction in global memory
    for (int stride = 1; stride < blockDim.x; stride *= 2) // Optimized loop start from 1
    {
        // Check that stride element is within bounds 
        if (tid % (2 * stride) == 0 && tid + stride < blockDim.x) // Ensure no out of bounds access
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Synchronize threads in each step
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}