#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the use of a single blockIdx for better caching
__global__ void vec_erfcx (int n, double *result, double *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        result[id] = erfcx(x[id]);
    }
}