#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LengthFromElements(float* element1, float* element2, float* output, int count)
{
    // Calculate unique global thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure the thread ID is within the bounds
    if(threadId < count)
    {
        // Compute the length and store in the output
        float x = element1[threadId];
        float y = element2[threadId];
        output[threadId] = sqrtf(x * x + y * y);
    }
}