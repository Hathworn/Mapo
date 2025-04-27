#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using blockDim.x index calculation for 1D block
__global__ void vec_gte (int n, double *result, double  *x, double  *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // 1D block thread index
    if (id < n)
    {
        result[id] = (x[id] >= y[id]) ? 1.0 : 0.0;
    }
}