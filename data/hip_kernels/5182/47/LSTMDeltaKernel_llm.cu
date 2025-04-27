#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LSTMDeltaKernel(float *cellStateErrors, float *outputGateDeltas, float *cellStates, float *outputGateActivations, float *outputGateActivationDerivatives, float *deltas, int cellCount, int cellsPerBlock) {
    int memoryBlockId = blockDim.x * blockIdx.y * gridDim.x
                      + blockDim.x * blockIdx.x
                      + threadIdx.x;

    if (memoryBlockId < cellCount / cellsPerBlock) {
        // Efficient use of registers for temporary variables
        float outputGateDeltaSum = 0.0f;
        float memoryBlockActivation = outputGateActivations[memoryBlockId];
        float memoryBlockDerivative = outputGateActivationDerivatives[memoryBlockId];

        int startIdx = memoryBlockId * cellsPerBlock;
        int endIdx = startIdx + cellsPerBlock;

        // Loop unrolling for optimization
        #pragma unroll
        for (int cellId = startIdx; cellId < endIdx; cellId++) {
            float delta = deltas[cellId];
            cellStateErrors[cellId] = memoryBlockActivation * delta;
            outputGateDeltaSum += cellStates[cellId] * delta;
        }

        outputGateDeltas[memoryBlockId] = memoryBlockDerivative * outputGateDeltaSum;
    }
}