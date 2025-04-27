#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8
    if (idx + 7 * blockDim.x < n)
    {
        // Load inputs into registers and perform unrolled reduction
        int sum = g_idata[idx] + g_idata[idx + blockDim.x] +
                  g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x] +
                  g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] +
                  g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
        idata[tid] = sum;
    }
    else if (idx < n) // Handle remaining elements
    {
        idata[tid] = g_idata[idx];
    }
    else
    {
        idata[tid] = 0; // Handle out-of-bounds
    }

    __syncthreads();

    // In-place reduction in shared memory
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