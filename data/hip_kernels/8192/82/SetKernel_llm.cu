#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetKernel(float *buffer, int offset, float value, int count)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;  // Calculate linear thread ID

    if (threadId < count)  // Ensure thread ID is within bounds
    {
        buffer[threadId + offset] = value;  // Write value to the corresponding buffer position
    }
}