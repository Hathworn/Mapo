#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredLess(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // Improved in-place reduction in shared memory for better memory access patterns
    __shared__ int smem[1024]; // Assuming blockDim.x <= 1024
    smem[tid] = idata[tid];
    __syncthreads();

    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        int index = 2 * stride * tid;
        if (index < blockDim.x)
        {
            smem[index] += smem[index + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}