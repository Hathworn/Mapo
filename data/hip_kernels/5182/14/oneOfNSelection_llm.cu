#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void oneOfNSelection(float *buffer, int* index, int size, float value)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Compute flattened global thread ID

    if (threadId < size) // Check if threadId is within bounds
    {
        buffer[threadId] = (threadId == index[0]) ? value : 0; // Set value or zero based on condition
    }
}