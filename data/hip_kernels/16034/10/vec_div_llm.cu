#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_div (int n, double *result, double *x, double *y)
{
    // Use a single index calculation to reduce redundant operations
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x) + (threadIdx.y * blockDim.x);
    
    // Use if condition to avoid out-of-bounds access
    if (id < n)
    {
        result[id] = x[id] / y[id];
    }
}