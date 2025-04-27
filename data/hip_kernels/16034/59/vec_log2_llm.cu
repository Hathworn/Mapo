#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using 1D grid and 1D block for better memory coalescing
__global__ void vec_log2(int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid unnecessary computations with direct access
    if (id < n) 
    {
        result[id] = log2(x[id]);
    }
}