#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LSTMDeltaKernelBPTT( float* deltas, float* cellStates, float* previousCellStates, float* cellStateErrors, float* nextCellStateErrors,  float* outputGateDeltas, float* forgetGateDeltas, float* nextForgetGateDeltas, float* inputGateDeltas, float* nextInputGateDeltas, float* cellInputDeltas,  float* cellInputActivations, float* cellStateActivations, float* outputGateActivations, float* nextForgetGateActivations, float* inputGateActivations,  float* cellInputActivationDerivatives, float* cellStateActivationDerivatives, float* outputGateActivationDerivatives, float* forgetGateActivationDerivatives, float* inputGateActivationDerivatives,  float* cellInputWeights, float* outputGateWeights, float* forgetGateWeights, float* inputGateWeights,  int inputCount, int cellCount, int cellsPerBlock )
{
    int memoryBlockId = blockDim.x * blockIdx.y * gridDim.x   //rows preceding current row in grid
                      + blockDim.x * blockIdx.x              //blocks preceding current block
                      + threadIdx.x;

    if (memoryBlockId < cellCount / cellsPerBlock)
    {
        // Initialize outputGateDeltas for memoryBlockId
        outputGateDeltas[memoryBlockId] = 0;
        float tempOutputDelta = 0; // Use a local variable for reduction
        for (int cellId = memoryBlockId * cellsPerBlock; cellId < (memoryBlockId + 1) * cellsPerBlock; cellId++)
        {
            tempOutputDelta += cellStateActivations[cellId] * deltas[cellId];
        }
        outputGateDeltas[memoryBlockId] = tempOutputDelta * outputGateActivationDerivatives[memoryBlockId];

        // Loop through cells within the block
        for (int cellId = memoryBlockId * cellsPerBlock; cellId < (memoryBlockId + 1) * cellsPerBlock; cellId++)
        {
            int relativeCellId = cellId - (memoryBlockId * cellsPerBlock);
            int peepHoleWeightId = (memoryBlockId * (inputCount + cellCount + cellsPerBlock + 1)) + inputCount + cellCount + relativeCellId;
            float cellStateError = deltas[cellId] * outputGateActivations[memoryBlockId] * cellStateActivationDerivatives[cellId] +
                                   nextCellStateErrors[cellId] * nextForgetGateActivations[memoryBlockId] +
                                   nextInputGateDeltas[memoryBlockId] * inputGateWeights[peepHoleWeightId] +
                                   nextForgetGateDeltas[memoryBlockId] * forgetGateWeights[peepHoleWeightId] +
                                   outputGateDeltas[memoryBlockId] * outputGateWeights[peepHoleWeightId];
            cellStateErrors[cellId] = cellStateError;

            cellInputDeltas[cellId] = inputGateActivations[memoryBlockId] * cellInputActivationDerivatives[cellId] * cellStateErrors[cellId];
        }

        // Initialize gate deltas
        float tempInputDelta = 0;
        float tempForgetDelta = 0;
        for (int cellId = memoryBlockId * cellsPerBlock; cellId < (memoryBlockId + 1) * cellsPerBlock; cellId++)
        {
            tempInputDelta += cellStateErrors[cellId] * cellInputActivations[cellId];
            tempForgetDelta += cellStateErrors[cellId] * previousCellStates[cellId];
        }
        inputGateDeltas[memoryBlockId] = tempInputDelta * inputGateActivationDerivatives[memoryBlockId];
        forgetGateDeltas[memoryBlockId] = tempForgetDelta * forgetGateActivationDerivatives[memoryBlockId];
    }
}