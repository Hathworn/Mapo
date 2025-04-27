#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_Optimized(float *a, float *b, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use striding to allow multiple iterations per thread
    size_t stride = blockDim.x * gridDim.x;
    
    for (size_t i = idx; i < len; i += stride)
    {
        b[i] = a[i];
    }
}