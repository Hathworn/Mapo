#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_y(int *g_odata, int *g_idata, int n) 
{
    extern __shared__ int temp[];  // allocated on invocation
    int thid = threadIdx.x;
    int bid = blockIdx.x;
    int bdim = blockDim.x;
    int gdim = gridDim.x;
    int offset = 1;

    // Use a single global memory read for both elements
    int ai = bid + (2 * thid) * gdim;
    int bi = ai + gdim;
    temp[2 * thid]   = g_idata[ai]; // load input into shared memory
    temp[2 * thid+1] = g_idata[bi]; 

    // Unroll loop if possible for better performance
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

    if (thid == 0) { temp[n - 1] = 0; } // clear the last element

    // Unroll loop if possible for down-sweep
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

    // Optimize write-back by reducing conditionals
    g_odata[ai] = temp[2 * thid + 1]; // write results to device memory
    g_odata[bi] = (2 * thid + 2 == bdim * 2) ? 
                  temp[2 * thid + 1] + g_idata[bi] : 
                  temp[2 * thid + 2];
}