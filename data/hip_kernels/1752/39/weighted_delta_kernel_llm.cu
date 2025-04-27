#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop

    for (; i < n; i += stride) { // Use grid-stride loop for better memory coalescing
        // Use conditional operator for concise branching
        if (da) da[i] += dc[i] * s[i]; 
        db[i] += dc[i] * (1-s[i]);
        ds[i] += dc[i] * (a[i] - b[i]); // Simplify operation
    }
}