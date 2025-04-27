#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access pattern by calculating the global thread index more efficiently
__global__ void vec_scalarAdd(int n, double *result, double x, double *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate linear thread index
    if (id < n) 
    {
        result[id] = x + y[id];
    }
}