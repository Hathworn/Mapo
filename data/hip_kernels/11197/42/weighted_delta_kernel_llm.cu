#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure thread is within bounds
    if (i < n) {
        // Use local variable to avoid multiple memory reads
        float dc_val = dc[i];
        float s_val = s[i];

        if (da) {
            // Use fused multiply-add operation for possible performance benefit
            da[i] = fmaf(dc_val, s_val, da[i]);
        }
        
        db[i] = fmaf(dc_val, 1.0f - s_val, db[i]);
        ds[i] = fmaf(dc_val, a[i], ds[i]) - dc_val * b[i];  // Reuse dc_val for common subexpression
    }
}