#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for better memory access patterns and reduced branching
__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(i < n){
        float dc_i = dc[i];
        float s_i = s[i];
        ds[i] += dc_i * (a[i] - b[i]);

        // Use conditional within the same block to reduce branching
        if (da) {
            float da_i = dc_i * s_i;
            da[i] += da_i;
        }
        if (db) {
            float db_i = dc_i * (1.0f - s_i);
            db[i] += db_i;
        }
    }
}