#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (pos < len) 
    {
        // Efficient parallel scaling of vector elements
        d_res[pos] = d_src[pos] * scale;
    }
}