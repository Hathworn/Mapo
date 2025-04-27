#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use local variable to store thread position for performance
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary within the main computation block
    if (pos < len) {
        d_res[pos] = d_src[pos] * scale;
    }
}