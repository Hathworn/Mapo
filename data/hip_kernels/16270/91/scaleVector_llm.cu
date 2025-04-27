#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate the global thread index and stride
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Use striding for better load balancing and coalescing
    for (int i = pos; i < len; i += stride)
    {
        d_res[i] = d_src[i] * scale;
    }
}