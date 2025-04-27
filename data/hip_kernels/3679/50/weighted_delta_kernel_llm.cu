#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid index calculation
    int stride = blockDim.x * gridDim.x;           // Calculate stride for grid-stride loop

    for (; i < n; i += stride) {                   // Grid-stride loop for better occupancy
        float dc_val = dc[i];                      // Load dc[i] once for efficiency
        float s_val = s[i];                        // Load s[i] once for efficiency
        if(da) da[i] += dc_val * s_val;            // Update da with preloaded values
        if(db) db[i] += dc_val * (1 - s_val);      // Update db with preloaded values
        ds[i] += dc_val * (a[i] - b[i]);           // Update ds with preloaded values
    }
}