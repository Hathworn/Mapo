#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NegativeCorrelationForwardSumKernel( float* inputPtr, float* outputPtr, int thisLayerSize )
{
    // Calculate index j using efficient block indexing technique
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries and perform addition
    if (j < thisLayerSize)
    {
        outputPtr[j] += inputPtr[j];
    }
}