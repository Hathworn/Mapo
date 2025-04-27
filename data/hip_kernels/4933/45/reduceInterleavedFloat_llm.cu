#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleavedFloat (float *g_idata, float *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    float *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if(idx >= n) return;

    // In-place reduction within this block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Ensure all threads have completed this stride before moving to the next
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}