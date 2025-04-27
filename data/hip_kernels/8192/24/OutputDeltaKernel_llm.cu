#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OutputDeltaKernel(float *outputDeltas, float *target, float *outputActivations, float *outputActivationDerivatives)
{
    int unitId = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified unitId calculation
    if (unitId < D_OUTPUT_UNITS)
    {
        outputDeltas[unitId] = (target[unitId] - outputActivations[unitId]) * outputActivationDerivatives[unitId];
    }
}