#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for vector addition with scalar
__global__ void vec_addScalar (int n, double *result, double *x, double y)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    for (int id = idx; id < n; id += stride) // Loop over elements within grid
    {
        result[id] = x[id] + y; // Perform addition with scalar
    }
}