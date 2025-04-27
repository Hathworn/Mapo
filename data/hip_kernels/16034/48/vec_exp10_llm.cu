#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_exp10 (int n, double *result, double  *x)
{
    // Optimize by using a single index calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single-dimensional grid for better performance
    if (id < n)
    {
        result[id] = exp10(x[id]);
    }
}