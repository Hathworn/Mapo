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
    
    // Coalesced memory access
    int ai = 2 * thid;
    int bi = ai + 1;
    int g_ai = bid + ai * gdim;
    int g_bi = g_ai + gdim;
    temp[ai] = g_idata[g_ai];
    temp[bi] = g_idata[g_bi];
    
    for (int d = n >> 1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (thid < d)
        {
            ai = offset * (2 * thid + 1) - 1;
            bi = offset * (2 * thid + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }

    if (thid == 0) { temp[n - 1] = 0; }
    
    for (int d = 1; d < n; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (thid < d)
        {
            ai = offset * (2 * thid + 1) - 1;
            bi = offset * (2 * thid + 2) - 1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    
    __syncthreads();

    g_odata[g_ai] = temp[bi]; // Optimize: Directly writing updated value
    if (bi + 1 == n) {
        g_odata[g_bi] = temp[bi] + g_idata[g_bi];
    } else {
        g_odata[g_bi] = temp[bi + 1];
    }
}