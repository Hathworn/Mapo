#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LSTMDeltaKernel(float *cellStateErrors, float *outputGateDeltas, float *cellStates,
                                float *outputGateActivations, float *outputGateActivationDerivatives,
                                float *deltas, int cellCount, int cellsPerBlock)
{
    // Optimize index calculation for better readability and reusability
    int memoryBlockId = blockIdx.x + blockIdx.y * gridDim.x;

    if (memoryBlockId * cellsPerBlock < cellCount)
    {
        float outputGateDeltaSum = 0.0;
        // Use registers to minimize memory accesses
        float sharedOutputGateActivation = outputGateActivations[memoryBlockId];
        float sharedOutputGateActivationDerivative = outputGateActivationDerivatives[memoryBlockId];
        
        for (int i = 0; i < cellsPerBlock; ++i)
        {
            int cellId = memoryBlockId * cellsPerBlock + i;
            if (cellId < cellCount)
            {
                float delta = deltas[cellId];
                cellStateErrors[cellId] = sharedOutputGateActivation * delta;
                outputGateDeltaSum += cellStates[cellId] * delta;
            }
        }
        
        // Reduce redundant computations by using shared variables
        outputGateDeltas[memoryBlockId] = sharedOutputGateActivationDerivative * outputGateDeltaSum;
    }
}