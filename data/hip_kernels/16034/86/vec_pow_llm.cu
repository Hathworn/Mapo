#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_pow (int n, double *result, double *x, double *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread indexing
    if (id < n) 
    {
        result[id] = pow(x[id], y[id]);  // Optimized by removing unnecessary calculations
    }
}