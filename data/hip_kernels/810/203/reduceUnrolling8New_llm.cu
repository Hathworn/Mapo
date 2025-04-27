#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8New(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8 with boundary check
    int tmp = 0;
    if (idx + 7 * blockDim.x < n)
    {
        // Improved unrolling with a single pointer update
        for (int i = 0; i < 8; i++)
        {
            tmp += g_idata[idx + i * blockDim.x];
        }
    }
    
    // Use shared memory for reduction to enhance memory access efficiency
    __shared__ int sharedData[256];
    sharedData[tid] = tmp;
    
    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            sharedData[tid] += sharedData[tid + stride];
        }

        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sharedData[0];
}