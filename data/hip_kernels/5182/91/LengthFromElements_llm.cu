#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LengthFromElements(float* element1, float* element2, float* output, int count)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID directly

    // Ensure threadId is within bounds before performing calculation
    if (threadId < count)
    {
        float e1 = element1[threadId];
        float e2 = element2[threadId];
        output[threadId] = sqrtf(e1 * e1 + e2 * e2);  // Optimize access by reducing multiple indexing
    }
}