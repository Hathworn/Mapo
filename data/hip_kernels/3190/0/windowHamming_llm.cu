#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void windowHamming(float* idata, int length)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    int totalThreads = gridDim.x * blockDim.x;

    // Unroll the loop to improve memory access and execution efficiency
    for (; tidx < length; tidx += totalThreads)
    {
        idata[tidx] = 0.54f - 0.46f * cosf(2.0f * tidx * PI_F / (length - 1));
    }
}