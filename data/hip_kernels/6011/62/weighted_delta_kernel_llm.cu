#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) {
        float dc_val = dc[i];
        float s_val = s[i];

        // Minimize repeated global memory reads
        if (da) da[i] += dc_val * s_val;
        db[i] += dc_val * (1.0f - s_val);
        ds[i] += dc_val * (a[i] - b[i]);
    }
}