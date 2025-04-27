#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_y(int *g_odata, int *g_idata, int n)
{
    extern __shared__ int temp[];  // allocated on invocation
    int thid = threadIdx.x;
    int bid = blockIdx.x;
    int bdim = blockDim.x;
    int gdim = gridDim.x;

    // Load input into shared memory
    temp[2 * thid] = g_idata[bid + 2 * thid * gdim];
    temp[2 * thid + 1] = g_idata[bid + 2 * thid * gdim + gdim];
    
    int offset = 1;
    
    // Build sum in place up the tree
    for (int d = n >> 1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (thid < d)
        {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }
    
    // Clear the last element
    if (thid == 0) { temp[n - 1] = 0; }
    
    // Traverse down tree and build scan
    for (int d = 1; d < n; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (thid < d)
        {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    
    __syncthreads();
    
    // Write results to device memory
    g_odata[bid + 2 * thid * gdim] = temp[2 * thid + 1];
    int second_ind = 2 * thid + 2;
    if (second_ind == bdim * 2)
    {
        g_odata[bid + 2 * thid * gdim + gdim] = temp[2 * thid + 1] + g_idata[bid + 2 * thid * gdim + gdim];
    }
    else
    {
        g_odata[bid + 2 * thid * gdim + gdim] = temp[2 * thid + 2];
    }
}