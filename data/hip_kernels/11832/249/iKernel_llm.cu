#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst, int dataSize)
{
    // Compute global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we're within the bounds of the input data
    if (idx < dataSize) {
        dst[idx] = src[idx] * 2.0f;
    }
}