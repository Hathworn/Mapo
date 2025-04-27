#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_double(double *a, double *b, double *c, size_t len)
{
    // Calculate the global index of the thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride looping to process more elements per thread and reduce global memory access
    size_t stride = blockDim.x * gridDim.x;
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + b[idx];
    }
}