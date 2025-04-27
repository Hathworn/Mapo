#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    // Ensure valid thread index within bounds
    if (i < n) {
        // Initialize pointers to access memory coalesced and avoid branch divergence
        float dc_val = dc[i];
        float s_val = s[i];
        float a_val = a[i];
        float b_val = b[i];
        
        // Use direct index with cached values for better memory access
        if (da) da[i] += dc_val * s_val;
        db[i] += dc_val * (1 - s_val);
        ds[i] += dc_val * (a_val - b_val);
    }
}