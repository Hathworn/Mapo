#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_y(int* g_odata, int* g_idata, int n) {
    extern __shared__ int temp[];
    int thid = threadIdx.x;
    int bid = blockIdx.x;
    int gdim = gridDim.x;
    int offset = 1;

    // Improved memory access pattern by calculating indices correctly
    int base_index = bid * n + 2 * thid * gdim;
    temp[2 * thid] = g_idata[base_index];
    temp[2 * thid + 1] = g_idata[base_index + gdim];
    
    for (int d = n >> 1; d > 0; d >>= 1) {
        __syncthreads();
        if (thid < d) {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }
    
    if (thid == 0) {
        temp[n - 1] = 0;
    }
    
    for (int d = 1; d < n; d *= 2) {
        offset >>= 1;
        __syncthreads();
        if (thid < d) {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;
            int t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }
    __syncthreads();

    // Write results to global memory with optimized index
    g_odata[base_index] = temp[2 * thid + 1];
    g_odata[base_index + gdim] = (2 * thid + 2 == n) ? temp[2 * thid + 1] + g_idata[base_index + gdim] : temp[2 * thid + 2];
}