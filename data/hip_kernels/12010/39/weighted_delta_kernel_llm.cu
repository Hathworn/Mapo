#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate unique global thread index in the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Process only valid indices
    if (i < n) {
        float delta_c = dc[i];
        float s_val = s[i];

        if (da) {
            da[i] += delta_c * s_val;     // Compute da only if da is not null
        }
        db[i] += delta_c * (1 - s_val);  // Update db
        ds[i] += delta_c * (a[i] - b[i]); // Update ds with calculated value
    }
}