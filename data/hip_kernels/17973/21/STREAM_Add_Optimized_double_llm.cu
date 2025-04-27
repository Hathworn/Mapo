#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Add_Optimized_double(double *a, double *b, double *c, size_t len)
{
    // Calculate global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop through elements in steps to process multiple in one go
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x)
    {
        // Add elements
        c[i] = a[i] + b[i];
    }
}