#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len) 
{
    // Calculate global index using built-in functions for better readability
    const int pos = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Use early return for out-of-bounds threads
    if (pos < len) 
    {
        d_res[pos] = d_src[pos] * scale; // Scale vector element-wise
    }
}