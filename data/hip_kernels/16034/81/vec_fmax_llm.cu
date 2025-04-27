#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimized kernel
__global__ void vec_fmax(int n, double *result, double *x, double *y)
{
    // Use 1D flattening for grid and block
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds
    if (id < n)
    {
        // Perform vector max operation
        result[id] = fmax(x[id], y[id]);
    }
}