#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function with conditional memory access
__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;

    // Process elements in a loop to handle more data per thread
    for (; i < n; i += totalThreads) {
        // Check bounds and perform operations
        if (i < n) {
            if (da) da[i] += dc[i] * s[i];
            if (db) db[i] += dc[i] * (1 - s[i]);
            ds[i] += dc[i] * (a[i] - b[i]);
        }
    }
}