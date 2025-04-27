#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the thread index calculation and improve memory access pattern.
__global__ void vec_gteScalar (int n, double *result, double *x, double y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n)
    {
        result[id] = (x[id] >= y) ? 1.0 : 0.0;
    }
}