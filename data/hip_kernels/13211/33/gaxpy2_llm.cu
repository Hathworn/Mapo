#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void gaxpy2(const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + threadIdx.z * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    // Use unique global thread index for better parallelization
    c[i] = a[0] * b[i] + c[i];  // REMEMBER ZERO INDEXING IN C LANGUAGE!!
}