#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_normcdfinv (int n, double *result, double *y)
{
    // Optimize calculation of id using 1D linear indexing
    int id = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Ensure access within bounds
    if (id < n) 
    {
        // Calculate inverse of standard normal cumulative distribution function
        result[id] = normcdfinv(y[id]);
    }
}