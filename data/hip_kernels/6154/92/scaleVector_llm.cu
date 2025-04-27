#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len) 
{
    // Calculate global thread position
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure position is within vector bounds
    if (pos < len) 
    {
        d_res[pos] = d_src[pos] * scale; // Scale and assign
    }
}