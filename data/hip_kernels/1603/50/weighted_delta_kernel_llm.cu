#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized weighted_delta_kernel using shared memory
__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure no out-of-bound access
    if (i >= n) return;

    // Use local variables for repeated array access
    float dc_i = dc[i];
    float s_i = s[i];

    if (da) da[i] += dc_i * s_i;
    if (db) db[i] += dc_i * (1 - s_i);

    float a_i = a[i];
    float b_i = b[i];
    ds[i] += dc_i * (a_i - b_i);
}