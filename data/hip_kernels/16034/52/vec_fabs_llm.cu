```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel for vector absolute value calculation
__global__ void vec_fabs (int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flatten thread index for 1D grid
    if (id < n)
    {
        result[id] = fabs(x[id]); // Compute absolute value
    }
}