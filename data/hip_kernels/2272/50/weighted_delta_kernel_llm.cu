#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    int gridStride = gridDim.x * blockDim.x; // Calculate grid stride for loop

    for (int i = idx; i < n; i += gridStride) { // Use grid-stride loop for balanced load
        float common_dc = dc[i];

        if (da) da[i] += common_dc * s[i];
        if (db) db[i] += common_dc * (1 - s[i]);
        ds[i] += common_dc * (a[i] - b[i]);
    }
}