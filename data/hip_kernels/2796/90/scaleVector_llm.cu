#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate position based on block and thread indices
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if position is within bounds and perform scaling
    if (pos < len) {
        d_res[pos] = d_src[pos] * scale;
    }
}