#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int gridSize = blockDim.x * gridDim.x;  // Calculate the grid size
    
    while (i < n) {
        // Perform calculations based on conditions
        if(da) da[i] += dc[i] * s[i];
        if(db) db[i] += dc[i] * (1 - s[i]);
        ds[i] += dc[i] * (a[i] - b[i]);

        i += gridSize;  // Move to the next element processed by this thread
    }
}