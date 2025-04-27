#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_ceil(int n, double *result, double *x)
{
    // Calculate 1D global thread index within the grid
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Check boundary condition for safe access
    if (id < n)
    {
        // Perform ceiling operation
        result[id] = ceil(x[id]);
    }
}