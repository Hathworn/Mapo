#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Process only if index is within bounds
    if (i < n) {
        float dc_i = dc[i]; // Load dc[i] once
        float s_i = s[i];   // Load s[i] once
        
        if (da) {
            da[i] += dc_i * s_i; // Update da if not null
        }
        
        // Update db and ds
        db[i] += dc_i * (1 - s_i);
        ds[i] += dc_i * (a[i] - b[i]);
    }
}