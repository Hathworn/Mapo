#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void oneOfNSelection(float *buffer, int* index, int size, float value)
{
    // Calculate a unique global thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (threadId < size) {
        // Set buffer[threadId] to value if threadId matches index[0], otherwise set to 0
        buffer[threadId] = (threadId == index[0]) ? value : 0;
    }
}