#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetAllButOneKernel(float *buffer, float value, int index, int count)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Optimize threadId calculation

    if (threadId < count && threadId != index)
    {
        buffer[threadId] = value;
    }
}