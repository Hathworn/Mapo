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

    // Use cooperative loading to maximize shared memory usage
    int ai = bid + (2 * thid) * gdim;
    int bi = ai + gdim;
    temp[2 * thid] = g_idata[ai]; 
    temp[2 * thid + 1] = g_idata[bi];

    // Build the sum in place up the tree
    for (int d = n >> 1; d > 0; d >>= 1) {
        __syncthreads();
        if (thid < d) {
            int indexA = offset * (2 * thid + 1) - 1;
            int indexB = offset * (2 * thid + 2) - 1;
            temp[indexB] += temp[indexA];
        }
        offset <<= 1;
    }

    // Clear the last element for downward pass
    if (thid == 0) {
        temp[n - 1] = 0;
    }

    // Traverse down tree and build scan
    for (int d = 1; d < n; d <<= 1) {
        offset >>= 1;
        __syncthreads();
        if (thid < d) {
            int indexA = offset * (2 * thid + 1) - 1;
            int indexB = offset * (2 * thid + 2) - 1;
            int t = temp[indexA];
            temp[indexA] = temp[indexB];
            temp[indexB] += t;
        }
    }

    __syncthreads();
    // Store results to global memory with improved index calculation
    g_odata[ai] = temp[2 * thid + 1];

    // Use ternary for clearer logic
    g_odata[bi] = (2 * thid + 2 == bdim * 2) ? temp[2 * thid + 1] + g_idata[bi] : temp[2 * thid + 2];
}