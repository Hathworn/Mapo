#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel by using 1D block and grid
__global__ void vec_lteScalar (int n, double *result, double *x, double y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread ID
    if (id < n) // Check boundary condition
    {
        result[id] = (x[id] <= y) ? 1.0 : 0.0; // Conditional assignment
    }
}