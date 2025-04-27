#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void vec_lt (int n, double *result, double *x, double *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // 1D index for improved mapping
    if (id < n)
    {
        result[id] = (x[id] < y[id]) ? 1.0 : 0.0; // Keep logic for vector comparison
    }
}