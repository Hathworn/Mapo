#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OutputDeltaKernel(float *outputDeltas, float *target, float *outputActivations, float *outputActivationDerivatives)
{
    // Calculate unitId using a simplified formula for better readability and performance
    int unitId = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
    
    // Check if the unitId is valid and compute the output delta if valid
    if (unitId < D_OUTPUT_UNITS)
    {
        outputDeltas[unitId] = (target[unitId] - outputActivations[unitId]) * outputActivationDerivatives[unitId];
    }
}