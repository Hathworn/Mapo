#include "hip/hip_runtime.h"
#include "includes.h"

// a simple CUDA kernel to add two vectors

extern "C" // ensure function name to be exactly "gaxpy2"
{
}

__global__ void CalpahGax(const double alpha, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Reorder for clarity
    // Check if index is within bounds to avoid out-of-bounds access
    if (i < N) 
    {
        c[i] = alpha * a[0] * b[i];
    }
}