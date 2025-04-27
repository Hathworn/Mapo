#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtractMean(float* d_inputArray, uint64_t inputLength, float d_mean)
{
    // Use local variables for improved memory access
    uint32_t globalThreadIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Eliminate branch divergence by directly returning if condition fails
    if (globalThreadIndex < inputLength)
    {
        // Efficient memory access
        float temp = d_inputArray[globalThreadIndex];
        temp -= d_mean;
        d_inputArray[globalThreadIndex] = temp;
    }
}