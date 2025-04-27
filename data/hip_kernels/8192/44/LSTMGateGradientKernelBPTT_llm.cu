#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LSTMGateGradientKernelBPTT(float *input, float *previousOutput, float *cellStates, float *inputGateDeltas, float *forgetGateDeltas, float *outputGateDeltas, float* outputGateWeightGradient, float* inputGateWeightGradient, float* forgetGateWeightGradient, int inputCount, int previousOutputCount, int cellsPerBlock)
{
    // Calculate weightId more neatly
    int weightId = blockIdx.x + blockIdx.y * gridDim.x * blockDim.x + threadIdx.x;

    int weightsPerGate = inputCount + previousOutputCount + cellsPerBlock + 1;

    if (weightId < weightsPerGate * previousOutputCount / cellsPerBlock)
    {
        int fromId = weightId % weightsPerGate;
        int toId = weightId / weightsPerGate;

        bool isFromInputUnit = fromId < inputCount;
        bool isFromPreviousOutputUnit = fromId >= inputCount && fromId < inputCount + previousOutputCount;
        bool isPeephole = fromId >= inputCount + previousOutputCount && fromId < inputCount + previousOutputCount + cellsPerBlock;
        bool isFromBiasUnit = fromId == inputCount + previousOutputCount + cellsPerBlock;

        float inputFromWeight = 0.0f;
        if (isFromInputUnit) {
            inputFromWeight = input[fromId];
        } else if (isFromPreviousOutputUnit) {
            inputFromWeight = previousOutput[fromId - inputCount];
        } else if (isPeephole) {
            inputFromWeight = cellStates[toId * cellsPerBlock + (fromId - inputCount - previousOutputCount)];
        } else if (isFromBiasUnit) {
            inputFromWeight = 1.0f;
        }

        // Optimization: reduce redundant multiplication operations
        outputGateWeightGradient[weightId] = outputGateDeltas[toId] * inputFromWeight;
        inputGateWeightGradient[weightId] = inputGateDeltas[toId] * inputFromWeight;
        forgetGateWeightGradient[weightId] = forgetGateDeltas[toId] * inputFromWeight;
    }
}