#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use shared memory if beneficial on target hardware

    if (i < n) {
        float s_val = s[i];
        float dc_val = dc[i];
        if (da) da[i] += dc_val * s_val;  // Use temporary variable to reduce memory access
        if (db) db[i] += dc_val * (1 - s_val);
        ds[i] += dc_val * (a[i] - b[i]);
    }
}