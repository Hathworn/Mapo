#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Flatten block index computation
    int gridStride = blockDim.x * gridDim.x;        // Calculate stride for grid-stride looping

    for (; i < n; i += gridStride) {                // Use grid-stride loop for better occupancy
        if (da) da[i] += dc[i] * s[i];
        db[i] += dc[i] * (1 - s[i]);
        ds[i] += dc[i] * (a[i] - b[i]);             // Simplify the calculation of ds[i]
    }
}