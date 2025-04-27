#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop for optimization
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (da) da[i] += dc[i] * s[i];
        if (db) db[i] += dc[i] * (1 - s[i]);
        ds[i] += dc[i] * (a[i] - b[i]);
    }
}