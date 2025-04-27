#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_CalcGradStep(float* sinkBuffer, float* incBuffer, float* divBuffer, float* labelBuffer, float stepSize, float iCC, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within the bounds
    if( idx < size )
    {
        // Improved calculation to avoid redundant operations
        float value = stepSize * (sinkBuffer[idx] + divBuffer[idx] - incBuffer[idx] - labelBuffer[idx] * iCC);
        divBuffer[idx] = value;
    }
}