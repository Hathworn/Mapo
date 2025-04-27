#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction in shared memory to reduce global memory access
    __shared__ int shared_idata[1024]; // Assume max blockDim.x is 1024
    shared_idata[tid] = idata[tid];
    __syncthreads();

    // Optimal reduction process using shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            shared_idata[tid] += shared_idata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = shared_idata[0];
}