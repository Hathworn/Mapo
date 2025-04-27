#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    if(i < n){
        float dc_i = dc[i];  // Cache dc[i] to avoid repeated access
        float s_i = s[i];    // Cache s[i] to avoid repeated access
        if(da) da[i] += dc_i * s_i;
        db[i] += dc_i * (1 - s_i);
        ds[i] += dc_i * (a[i] - b[i]);  // Combined addition operations
    }
}