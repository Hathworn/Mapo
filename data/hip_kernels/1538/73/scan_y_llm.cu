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

    // Coalesced global memory access
    int ai_global = bid + (2*thid) * gdim;
    int bi_global = ai_global + gdim;

    temp[2*thid]   = g_idata[ai_global];
    temp[2*thid+1] = g_idata[bi_global];

    for (int d = n>>1; d > 0; d >>= 1) {
        __syncthreads();
        if (thid < d) {
            int ai = offset*(2*thid+1)-1;
            int bi = offset*(2*thid+2)-1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }

    if (thid == 0) { temp[n - 1] = 0; }

    for (int d = 1; d < n; d *= 2) {
        offset >>= 1;
        __syncthreads();
        if (thid < d) {
            int ai = offset*(2*thid+1)-1;
            int bi = offset*(2*thid+2)-1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    __syncthreads();

    // Coalesced writing back to global memory
    g_odata[ai_global] = temp[2*thid+1];
    g_odata[bi_global] = (2*thid+2 == bdim*2) ? temp[2*thid+1] + g_idata[bi_global] : temp[2*thid+2];
}