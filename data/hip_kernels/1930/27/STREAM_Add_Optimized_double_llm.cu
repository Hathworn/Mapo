#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_Optimized_double(double *a, double *b, double *c, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Process all elements by iterating over the grid
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}