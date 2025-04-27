#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate a unique global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensures the work is within bounds
    if(i < n){
        float dc_val = dc[i];
        float s_val = s[i];

        // Conditionally update da and db
        if (da) da[i] += dc_val * s_val;  // Weight update for da
        if (db) db[i] += dc_val * (1 - s_val);  // Weight update for db

        // Always update ds
        ds[i] += dc_val * (a[i] - b[i]);  // Update for ds
    }
}