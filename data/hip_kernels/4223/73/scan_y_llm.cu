#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_y(int *g_odata, int *g_idata, int n)
{
    extern __shared__ int temp[];
    int thid = threadIdx.x;
    int bid = blockIdx.x;
    int bdim = blockDim.x;
    int gdim = gridDim.x;
    int offset = 1;
    
    // Load input into shared memory with coalesced access
    int index = bid * bdim * 2 + thid;
    temp[2*thid]   = g_idata[index];
    temp[2*thid+1] = g_idata[index + bdim];
    
    // Reduction phase to build the sum
    for (int d = n>>1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (thid < d)
        {
            int ai = offset*(2*thid+1)-1;
            int bi = offset*(2*thid+2)-1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }
    
    // Clear the last element
    if (thid == 0) { temp[n - 1] = 0; }
    
    // Down-sweep phase to build the scan
    for (int d = 1; d < n; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (thid < d)
        {
            int ai = offset*(2*thid+1)-1;
            int bi = offset*(2*thid+2)-1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    __syncthreads();
    
    // Write results to device memory
    g_odata[index] = temp[2*thid+1];
    if (2*thid+2 < n)
    {
        g_odata[index + bdim] = temp[2*thid+2];
    }
    else
    {
        g_odata[index + bdim] = temp[2*thid+1] + g_idata[index + bdim];
    }
}