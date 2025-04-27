```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Perform calculations only if index is within bounds
    if (i < n) {
        float dci = dc[i]; // Pre-load dc[i] to reduce redundant memory access
        float si = s[i];   // Pre-load s[i] to reduce redundant memory access
        
        if (da) da[i] += dci * si;
        db[i] += dci * (1.0f - si);
        ds[i] += dci * (a[i] - b[i]);
    }
}