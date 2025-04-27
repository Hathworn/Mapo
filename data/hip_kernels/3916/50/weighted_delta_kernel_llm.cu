#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if(i < n) {
        float dc_val = dc[i];
        float s_val = s[i];
        if(da) da[i] += dc_val * s_val;  // Update da if not null
        if(db) db[i] += dc_val * (1.0f - s_val);  // Update db if not null using 1.0f for float conversion
        ds[i] += dc_val * (a[i] - b[i]);  // Update ds
    }
}