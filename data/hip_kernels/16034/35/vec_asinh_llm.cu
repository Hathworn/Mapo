#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel by using 1D grid and block for more efficient execution
__global__ void vec_asinh(int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Flatten the block and grid dimensions into 1D index
    if (id < n)
    {
        result[id] = asinh(x[id]);  // Compute asinh for the valid index
    }
}