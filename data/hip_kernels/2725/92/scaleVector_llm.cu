#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate position for each thread
    int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop to process more data if thread count is less than data length
    while (pos < len) 
    {
        d_res[pos] = d_src[pos] * scale;
        // Advance index by total number of threads
        pos += blockDim.x * gridDim.x;
    }
}