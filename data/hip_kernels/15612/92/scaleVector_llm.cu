#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate global thread index
    int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop to handle stragglers in a single thread
    while (pos < len) {
        d_res[pos] = d_src[pos] * scale;
        pos += gridDim.x * blockDim.x; // Move to next stride
    }
}