#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) {
        float dci = dc[i]; // Load dc[i] into a register for reuse
        float si = s[i];   // Load s[i] into a register for reuse
        if (da) da[i] += dci * si;
        if (db) db[i] += dci * (1 - si);
        ds[i] += dci * (a[i] - b[i]);
    }
}