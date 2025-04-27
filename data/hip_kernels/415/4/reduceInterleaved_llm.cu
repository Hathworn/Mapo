#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (idx >= n) return;
    
    // In-place reduction in global memory
    int sum = g_idata[idx]; // Load data into register
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (tid < stride)
        {
            sum += g_idata[idx + stride]; // Use register variable
        }
        __syncthreads();
        g_idata[idx] = sum; // Store partial result back
    }

    // Write result for this block to global memory
    if (tid == 0) 
    {
        g_odata[blockIdx.x] = g_idata[idx];
    }
}