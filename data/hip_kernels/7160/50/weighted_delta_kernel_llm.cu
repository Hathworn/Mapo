#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure thread index is within bounds
    if (i < n) {
        // Perform operations with appropriate checks
        float dc_val = dc[i];
        float s_val = s[i];

        if (da) {
            da[i] += dc_val * s_val;
        }
        if (db) {
            db[i] += dc_val * (1 - s_val);
        }
        
        ds[i] += dc_val * (a[i] - b[i]);
    }
}