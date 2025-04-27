#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredLess(int *g_idata, int *g_odata, unsigned int n)
{
    // Set the thread id and block id
    unsigned int tid = threadIdx.x;
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Convert global data pointer to the local pointer of this block.
    int *idata = g_idata + blockIdx.x * blockDim.x;
    
    // Boundary check.
    if (idx >= n) return;
    
    // Loop unrolling for efficiency
    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        // Use volatile to prevent compiler optimization issues
        volatile int* v_idata = idata;
        
        // Convert tid into local array index.
        int index = 2 * stride * tid;
        
        if (index < blockDim.x)
        {
            v_idata[index] += v_idata[index + stride];
        }

        // Synchronize within threadblock.
        __syncthreads();
    }

    // Write result for this block to global memory.
    if (tid == 0)
    {
        g_odata[blockIdx.x] = idata[0];
    }
}