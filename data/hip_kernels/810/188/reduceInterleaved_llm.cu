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

    // In-place reduction in shared memory for faster access
    extern __shared__ int sdata[];
    sdata[tid] = idata[tid];
    __syncthreads();

    // Reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            // Perform reduction in shared memory
            sdata[tid] += sdata[tid + stride];
        }

        // Synchronize threads at each reduction step
        __syncthreads();
    }

    // Write result for this block to global memory from shared memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}