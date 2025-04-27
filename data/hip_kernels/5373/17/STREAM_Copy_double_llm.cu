#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_double(double *a, double *b, size_t len)
{
    // Use const for limiting register usage and optimizing memory access
    const size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride loop for better memory coalescing
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        b[i] = a[i];
    }
}