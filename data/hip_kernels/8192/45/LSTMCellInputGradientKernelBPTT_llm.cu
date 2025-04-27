#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LSTMCellInputGradientKernelBPTT(float *input, float *previousOutput, float *cellInputDeltas, float *cellInputWeightGradient, int inputCount, int previousOutputCount, int cellsPerBlock) 
{
    // Calculate weight index for this thread
    int weightId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int weightsPerCell = inputCount + previousOutputCount + 1;

    // Ensure weightId is within bounds
    if (weightId >= weightsPerCell * previousOutputCount) return;

    int fromId = weightId % weightsPerCell;
    int toId = weightId / weightsPerCell;

    // Use boolean values to conditionally select which input to use
    int isFromInputUnit = (fromId < inputCount);
    int isFromPreviousOutputUnit = (fromId >= inputCount && fromId < inputCount + previousOutputCount);
    int isFromBiasUnit = (fromId == inputCount + previousOutputCount);

    // Use conditional operator for cleaner assignment
    float inputFromWeight = isFromInputUnit * input[fromId] +
                            isFromPreviousOutputUnit * previousOutput[fromId - inputCount] +
                            isFromBiasUnit * 1.0f;

    // Calculate the gradient
    cellInputWeightGradient[weightId] = cellInputDeltas[toId] * inputFromWeight;
}