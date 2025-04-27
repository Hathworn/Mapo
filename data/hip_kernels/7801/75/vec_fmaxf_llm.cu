#include "hip/hip_runtime.h"
#include "includes.h"

// === Vector math (two arguments) ============================================

__global__ void vec_fmaxf(size_t n, float *result, float *x, float *y) 
{
    // Compute the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread processes a valid element
    if (id < n) 
    {
        // Perform the element-wise maximum operation
        result[id] = fmaxf(x[id], y[id]);
    }
}