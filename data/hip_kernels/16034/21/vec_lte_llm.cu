#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_lte(int n, double *result, double *x, double *y)
{
    // Calculate unique thread index in the grid.
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x * blockDim.x);

    // Check bounds before performing operations.
    if (id < n) {
        // Store result of comparison directly.
        result[id] = (x[id] <= y[id]) ? 1.0 : 0.0;
    }
}