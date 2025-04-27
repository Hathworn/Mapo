#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flattened grid index for 1D block
    int stride = gridDim.x * blockDim.x; // Stride for grid-stride loop

    for (; i < n; i += stride) { // Grid-stride loop for improved memory coalescing
        float dc_val = dc[i];
        float s_val = s[i];
        if (da) da[i] += dc_val * s_val; // Use temporary variables
        if (db) db[i] += dc_val * (1.0f - s_val);
        ds[i] += dc_val * (a[i] - b[i]);
    }
}