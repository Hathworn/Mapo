#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_exp (int n, double *result, double *x)
{
    // Optimize by calculating a flat index directly
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.y + threadIdx.y) * (blockDim.x * gridDim.x);
    
    // Check bounds and perform computation
    if (id < n) 
    {
        result[id] = exp(x[id]);
    }
}