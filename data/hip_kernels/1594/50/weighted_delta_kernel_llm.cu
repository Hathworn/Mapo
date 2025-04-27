#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x) * blockDim.x; 

    // Check within bounds
    if(i < n)
    {
        float dc_val = dc[i]; // Cache dc[i] value
        float s_val = s[i];   // Cache s[i] value

        // Update da if da is not null
        if(da) 
            da[i] += dc_val * s_val;
        
        // Update db if db is not null
        if(db) 
            db[i] += dc_val * (1 - s_val);

        // Update ds
        ds[i] += dc_val * (a[i] - b[i]);
    }
}