#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use of stride loop to handle larger vectors efficiently
    for (int i = pos; i < len; i += blockDim.x * gridDim.x) 
    {
        d_res[i] = d_src[i] * scale;
    }
}