#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize vec_expm1 kernel function
__global__ void vec_expm1 (int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (id < n)
    {
        result[id] = expm1(x[id]); // Compute expm1 for each element if within bounds
    }
}