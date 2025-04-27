#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void vec_sin(int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D global thread index
    if (id < n) 
    {
        result[id] = sin(x[id]); // Compute sine if within bounds
    }
}