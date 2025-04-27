#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation assuming 1D grid configuration

    // Utilize shared memory or registers to minimize global memory accesses 
    if (i < n) {
        float si = s[i];
        float dci = dc[i];
        if (da) da[i] += dci * si;
        if (db) db[i] += dci * (1 - si);
        ds[i] += dci * (a[i] - b[i]);
    }
}