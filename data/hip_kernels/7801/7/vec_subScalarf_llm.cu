#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel for vector-scalar subtraction
__global__ void vec_subScalarf(size_t n, float *result, float *x, float y)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform operation if within bounds
    if (id < n)
    {
        result[id] = x[id] - y;
    }
}