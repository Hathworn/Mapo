#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ResetLayerKernel(float *layer, float value, int count)
{
    // Calculate unique thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Only apply reset if threadId is within bounds
    if (threadId < count)
    {
        layer[threadId] = value;
    }
}