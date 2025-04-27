#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Scale_Optimized(float *a, float *b, float scale, size_t len)
{
    // Calculate global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Efficient boundary check and perform scaling
    if (idx < len) 
    {
        b[idx] = scale * a[idx];
    }
}