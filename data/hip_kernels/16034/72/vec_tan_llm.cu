#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize thread index calculations for better performance
__global__ void vec_tan (int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.x * gridDim.x) + threadIdx.y * blockDim.x;
    if (id < n)
    {
        result[id] = tan(x[id]);
    }
}