#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (i < n) {
        float dc_i = dc[i];
        float s_i = s[i];
        
        // Conditional update of da[i]
        if (da) da[i] += dc_i * s_i;
        
        // Update db[i] using local variables
        db[i] += dc_i * (1 - s_i);

        // Update ds[i] with atomicAdd to prevent race conditions
        atomicAdd(&ds[i], dc_i * (a[i] - b[i]));
    }
}