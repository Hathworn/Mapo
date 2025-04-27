#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate the thread position
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to handle multiple data points for better efficiency
    for (int i = pos; i < len; i += blockDim.x * gridDim.x)
    {
        d_res[i] = d_src[i] * scale;
    }
}