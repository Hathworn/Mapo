#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using warp shuffle for reduction
__global__ void reduceUnrollingOptimized(int *g_idata, int *g_odata, unsigned int n, unsigned int q)
{
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * q + tid;

    int sum = 0;
    if (idx + blockDim.x * (q - 1) < n)
    {
        // Perform unrolling and load data
        for (int i = 0; i < q; i++)
        {
            sum += g_idata[idx + blockDim.x * i];
        }
    }
    __syncthreads();

    // Perform warp-level reduction
    for (int stride = warpSize / 2; stride > 0; stride /= 2)
    {
        sum += __shfl_down(sum, stride);
    }

    // Store the result for the first thread of the warp
    if (tid % warpSize == 0) g_odata[blockIdx.x * (blockDim.x / warpSize) + tid / warpSize] = sum;

    __syncthreads();

    // Reduce block-level results to the first warp
    if (tid < warpSize)
    {
        volatile int *odata = g_odata;
        for (int stride = warpSize / 2; stride > 0; stride /= 2)
        {
            if (tid < stride)
            {
                odata[tid] += odata[tid + stride];
            }
        }

        // Write final result for this block to global memory
        if (tid == 0) g_odata[blockIdx.x] = odata[0];
    }
}