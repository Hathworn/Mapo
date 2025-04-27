#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation

    if(i < n){
        float dc_i = dc[i]; // Cache dc[i] value
        float s_i = s[i];   // Cache s[i] value

        if (da) da[i] += dc_i * s_i;
        if (db) db[i] += dc_i * (1.0f - s_i); // Use 1.0f for float operation
        ds[i] += dc_i * (a[i] - b[i]); // Combine operations for ds
    }
}