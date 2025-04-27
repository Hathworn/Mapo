#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizePositionKernel(float *input, float *normalized, float xMax, float yMax) 
{
    // Calculate a unique global thread ID for the 1D input
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Only the first thread performs normalization
    if (threadId == 0)
    {
        normalized[0] = input[0] / xMax;
        normalized[1] = input[1] / yMax;
    }
}