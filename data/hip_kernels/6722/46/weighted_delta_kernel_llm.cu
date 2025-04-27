#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure the index is within bounds
    if(i < n){
        float dc_val = dc[i]; // Cache repeated memory fetch
        float s_val = s[i];   // Cache repeated memory fetch
        float a_val = a[i];   // Cache repeated memory fetch
        float b_val = b[i];   // Cache repeated memory fetch

        // Perform conditional updates
        if(da) da[i] += dc_val * s_val;
        if(db) db[i] += dc_val * (1.0f - s_val);
        ds[i] += dc_val * (a_val - b_val);
    }
}