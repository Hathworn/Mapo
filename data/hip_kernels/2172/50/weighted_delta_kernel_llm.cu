#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if(i < n){
        float dc_val = dc[i]; // Cache dc[i] to reduce memory access
        float s_val = s[i];   // Cache s[i] to reduce memory access

        // Optimize conditions by combining them with cached values
        if(da) da[i] += dc_val * s_val;
        if(db) db[i] += dc_val * (1.0f - s_val);

        // Combine cached a[i] and b[i] operations to reduce memory access
        ds[i] += dc_val * (a[i] - b[i]);
    }
}