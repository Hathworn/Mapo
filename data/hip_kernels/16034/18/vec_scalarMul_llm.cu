#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_scalarMul (int n, double *result, double x, double *y)
{
    // Calculate unique thread ID for 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid index within bounds
    if (id < n)
    {
        result[id] = x * y[id];  // Perform scalar multiplication
    }
}