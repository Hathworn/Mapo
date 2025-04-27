#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Use shared memory for better performance if needed
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float dc_val = dc[i];
        float s_val = s[i];
        if (da) da[i] += dc_val * s_val;  // Combine loads and arithmetic
        db[i] += dc_val * (1 - s_val);   // Use stored value
        ds[i] += dc_val * (a[i] - b[i]); // Optimize arithmetic expression
    }
}