#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetKernel(float *buffer, int offset, float value, int count)
{
    // Use 1D grid and 1D block; simplify threadId computation for better readability
    int threadId = blockDim.x * blockIdx.x + threadIdx.x;

    if (threadId < count)  // Ensure threadId is within bounds
    {
        buffer[offset + threadId] = value; // Directly index with offset
    }
}