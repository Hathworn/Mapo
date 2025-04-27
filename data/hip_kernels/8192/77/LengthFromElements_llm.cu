#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LengthFromElements(float* element1, float* element2, float* output, int count)
{
    // Optimize threadId calculation to remove multiplication for y-dimension
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use if statement only when necessary
    if(threadId < count)
    {
        float val1 = element1[threadId];
        float val2 = element2[threadId];
        // Calculate without redundant multiplications
        output[threadId] = sqrtf(val1 * val1 + val2 * val2);
    }
}