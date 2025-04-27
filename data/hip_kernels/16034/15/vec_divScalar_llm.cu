#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel: Use 1D grid and 1D block for simplicity and better performance
__global__ void vec_divScalar(int n, double *result, double *x, double y)
{
    // Calculate global index for 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within bounds
    if (id < n)
    {
        result[id] = x[id] / y;
    }
}