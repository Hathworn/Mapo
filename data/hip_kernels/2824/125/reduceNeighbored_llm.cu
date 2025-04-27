#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored(int *g_idata, int *g_odata, unsigned int n) 
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction in shared memory
    for (int stride = 1; stride < blockDim.x; stride *= 2) 
    {
        int index = 2 * stride * tid; // Calculate element index for stride
        if (index < blockDim.x) 
        {
            idata[index] += idata[index + stride]; // Sum pairs of elements
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}