#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_cos (int n, double *result, double  *x)
{
    // Use 1D indexing for simplicity and fewer calculations
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n)
    {
        result[id] = cos(x[id]);
    }
}