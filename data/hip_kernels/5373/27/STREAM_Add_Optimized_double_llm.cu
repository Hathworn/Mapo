#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_Optimized_double(double *a, double *b, double *c, size_t len)
{
    // Calculate the global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided loop to ensure all elements are processed even with insufficient threads
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) 
    {
        c[i] = a[i] + b[i];
    }
}