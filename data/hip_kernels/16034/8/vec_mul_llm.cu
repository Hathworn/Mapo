#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization of the vec_mul kernel function
__global__ void vec_mul (int n, double *result, double *x, double *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate linear index using grid stride
    if (id < n)
    {
        result[id] = x[id] * y[id]; // Multiply vectors if index within bounds
    }
}