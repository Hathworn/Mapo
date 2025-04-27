#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float dc_val = dc[i];
        float s_val = s[i];
        if (da) da[i] += dc_val * s_val; // Update da if non-null
        db[i] += dc_val * (1 - s_val);  // Update db with pre-computed value
        ds[i] += dc_val * (a[i] - b[i]); // Combine operations on ds for efficiency
    }
}