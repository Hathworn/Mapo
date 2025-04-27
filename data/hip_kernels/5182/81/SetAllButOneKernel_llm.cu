```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetAllButOneKernel(float *buffer, float value, int index, int count)
{
    int threadId = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x; // Calculate global thread ID

    // Check if threadId is within bounds and not equal to index
    if (threadId < count && threadId != index) {
        buffer[threadId] = value; // Assign value to buffer
    }
}