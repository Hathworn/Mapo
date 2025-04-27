#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NormalizePositionKernel(float *input, float *normalized, float xMax, float yMax)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified threadId calculation

    if (threadId == 0) // Only first thread performs the normalization
    {
        normalized[0] = input[0] / xMax;
        normalized[1] = input[1] / yMax;
    }
}