#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LSTMDeltaKernelBPTT( float* deltas, float* cellStates, float* previousCellStates, float* cellStateErrors, float* nextCellStateErrors,  float* outputGateDeltas, float* forgetGateDeltas, float* nextForgetGateDeltas, float* inputGateDeltas, float* nextInputGateDeltas, float* cellInputDeltas,  float* cellInputActivations, float* cellStateActivations, float* outputGateActivations, float* nextForgetGateActivations, float* inputGateActivations,  float* cellInputActivationDerivatives, float* cellStateActivationDerivatives, float* outputGateActivationDerivatives, float* forgetGateActivationDerivatives, float* inputGateActivationDerivatives,  float* cellInputWeights, float* outputGateWeights, float* forgetGateWeights, float* inputGateWeights,  int inputCount, int cellCount, int cellsPerBlock )
{
    int memoryBlockId = blockDim.x * blockIdx.y * gridDim.x  // rows preceding current row in grid
                      + blockDim.x * blockIdx.x             // blocks preceding current block
                      + threadIdx.x;

    if (memoryBlockId < cellCount / cellsPerBlock)
    {
        // Optimize the computation by reducing redundant calculations
        int blockStart = memoryBlockId * cellsPerBlock;
        int blockEnd = (memoryBlockId + 1) * cellsPerBlock;
        int peepHoleBaseId = memoryBlockId * (inputCount + cellCount + cellsPerBlock + 1) + inputCount + cellCount;

        float outputDeltaSum = 0.0f;
        for (int cellId = blockStart; cellId < blockEnd; cellId++)
        {
            outputDeltaSum += cellStateActivations[cellId] * deltas[cellId];
        }
        outputGateDeltas[memoryBlockId] = outputDeltaSum * outputGateActivationDerivatives[memoryBlockId];

        // Reuse common calculations to minimize operations inside the loop
        float outputActivation = outputGateActivations[memoryBlockId];
        float nextForgetActivation = nextForgetGateActivations[memoryBlockId];
        float nextInputDelta = nextInputGateDeltas[memoryBlockId];
        float nextForgetDelta = nextForgetGateDeltas[memoryBlockId];
        float outputDelta = outputGateDeltas[memoryBlockId];
        float inputActivation = inputGateActivations[memoryBlockId];

        for (int cellId = blockStart; cellId < blockEnd; cellId++)
        {
            int relativeCellId = cellId - blockStart;
            int peepHoleWeightId = peepHoleBaseId + relativeCellId;

            float cellStateErr = deltas[cellId] * outputActivation * cellStateActivationDerivatives[cellId] +
                                 nextCellStateErrors[cellId] * nextForgetActivation +
                                 nextInputDelta * inputGateWeights[peepHoleWeightId] +
                                 nextForgetDelta * forgetGateWeights[peepHoleWeightId] +
                                 outputDelta * outputGateWeights[peepHoleWeightId];
            cellStateErrors[cellId] = cellStateErr;

            cellInputDeltas[cellId] = inputActivation * cellInputActivationDerivatives[cellId] * cellStateErr;
        }

        float inputDeltaSum = 0.0f;
        float forgetDeltaSum = 0.0f;
        for (int cellId = blockStart; cellId < blockEnd; cellId++)
        {
            inputDeltaSum += cellStateErrors[cellId] * cellInputActivations[cellId];
            forgetDeltaSum += cellStateErrors[cellId] * previousCellStates[cellId];
        }
        inputGateDeltas[memoryBlockId] = inputDeltaSum * inputGateActivationDerivatives[memoryBlockId];
        forgetGateDeltas[memoryBlockId] = forgetDeltaSum * forgetGateActivationDerivatives[memoryBlockId];
    }
}