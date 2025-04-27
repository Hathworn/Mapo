```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify the index calculation

    if (i < n) {
        float dc_val = dc[i]; // Load dc[i] once to reduce global memory reads
        float s_val = s[i];   // Load s[i] once to reduce global memory reads

        if (da) da[i] += dc_val * s_val;  // Update da if da is not null

        db[i] += dc_val * (1.0f - s_val); // Use cached s[i] value
        ds[i] += dc_val * (a[i] - b[i]);  // Use cached dc[i] value and operation reordering for clarity
    }
}