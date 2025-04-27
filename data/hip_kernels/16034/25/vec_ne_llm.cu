#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_ne (int n, double *result, double *x, double *y)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x;

    // Check boundary and calculate result
    if (id < n)
    {
        result[id] = (x[id] != y[id]) ? 1.0 : 0.0;
    }
}