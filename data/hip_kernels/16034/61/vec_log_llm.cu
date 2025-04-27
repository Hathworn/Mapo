#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_log(int n, double *result, double *x) 
{
    // Calculate global thread ID with 1D grid and 1D block
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within the bounds
    if (id < n) 
    {
        result[id] = log(x[id]);
    }
}