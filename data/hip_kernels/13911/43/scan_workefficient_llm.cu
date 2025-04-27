#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scan_workefficient(float *g_odata, float *g_idata, int n)
{
    // Dynamically allocated shared memory for scan kernels
    extern __shared__ float temp[];

    int thid = threadIdx.x;
    int offset = 1;

    // Load inputs into shared memory
    int ai = 2 * thid;
    int bi = 2 * thid + 1;
    temp[ai] = g_idata[ai];
    temp[bi] = g_idata[bi];

    // Build the sum in place up the tree
    for (int d = n >> 1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (thid < d)
        {
            int addrA = offset * (2 * thid + 1) - 1;
            int addrB = offset * (2 * thid + 2) - 1;

            temp[addrB] += temp[addrA];
        }
        offset *= 2;
    }

    // Clear the last element
    if (thid == 0) temp[n - 1] = 0;

    // Traverse down the tree building the scan in place
    for (int d = 1; d < n; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (thid < d)
        {
            int addrA = offset * (2 * thid + 1) - 1;
            int addrB = offset * (2 * thid + 2) - 1;

            float t = temp[addrA];
            temp[addrA] = temp[addrB];
            temp[addrB] += t;
        }
    }

    __syncthreads();

    // Write results to global memory
    g_odata[ai] = temp[ai];
    g_odata[bi] = temp[bi];
}