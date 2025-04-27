#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_double(double *a, double *b, double scale, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride loop for memory access
    size_t stride = blockDim.x * gridDim.x;
    
    for (; idx < len; idx += stride) {
        b[idx] = scale * a[idx];
    }
}