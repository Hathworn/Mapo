#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void prescan(float *g_odata, float *g_idata, int n)
{
    extern __shared__ float temp[];  // Shared memory
    int thid = threadIdx.x;
    int offset = 1;

    // Load input into shared memory
    int ai = 2 * thid;
    int bi = ai + 1;
    temp[ai] = g_idata[ai];
    temp[bi] = g_idata[bi];
    __syncthreads();  // Ensure all loads are done

    // Build sum in place up the tree
    for (int d = n >> 1; d > 0; d >>= 1)
    {
        if (thid < d)
        {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
        __syncthreads();  // Synchronize before next iteration
    }

    if (thid == 0) { temp[n - 1] = 0; } // Clear the last element

    // Traverse down tree & build scan
    for (int d = 1; d < n; d *= 2)
    {
        offset >>= 1;
        if (thid < d)
        {
            int ai = offset * (2 * thid + 1) - 1;
            int bi = offset * (2 * thid + 2) - 1;

            float t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
        __syncthreads();  // Synchronize before next iteration
    }
    
    // Write results to device memory
    g_odata[ai] = temp[ai];
    g_odata[bi] = temp[bi];
}