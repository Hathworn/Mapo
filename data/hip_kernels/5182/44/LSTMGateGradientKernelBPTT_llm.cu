#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LSTMGateGradientKernelBPTT( float *input, float *previousOutput, float *cellStates,  float *inputGateDeltas, float *forgetGateDeltas, float *outputGateDeltas,  float* outputGateWeightGradient, float* inputGateWeightGradient, float* forgetGateWeightGradient,  int inputCount, int previousOutputCount, int cellsPerBlock )
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x  //rows preceding current row in grid
                  + blockDim.x * blockIdx.x              //blocks preceding current block
                  + threadIdx.x;
    
    int weightsPerGate = inputCount + previousOutputCount + cellsPerBlock + 1;

    if (weightId < weightsPerGate * previousOutputCount / cellsPerBlock)
    {
        int fromId = weightId % weightsPerGate;
        int toId = weightId / weightsPerGate;

        // Using boolean instead of int for flags for better clarity
        bool isFromInputUnit = fromId < inputCount;
        bool isFromPreviousOutputUnit = (fromId >= inputCount) && (fromId < inputCount + previousOutputCount);
        bool isPeephole = (fromId >= inputCount + previousOutputCount) && (fromId < inputCount + previousOutputCount + cellsPerBlock);
        bool isFromBiasUnit = fromId == (inputCount + previousOutputCount + cellsPerBlock);

        // Precompute index offsets to avoid recalculating
        int prevOutputOffset = fromId - inputCount;
        int peepholeOffset = toId * cellsPerBlock + (fromId - inputCount - previousOutputCount);

        // Calculate inputFromWeight with conditional operators
        float inputFromWeight = 
            isFromInputUnit ? input[fromId] :
            isFromPreviousOutputUnit ? previousOutput[prevOutputOffset] :
            isPeephole ? cellStates[peepholeOffset] :
            isFromBiasUnit ? 1.0f : 0.0f;

        // Perform weight gradient computation
        outputGateWeightGradient[weightId] = outputGateDeltas[toId] * inputFromWeight;
        inputGateWeightGradient[weightId] = inputGateDeltas[toId] * inputFromWeight;
        forgetGateWeightGradient[weightId] = forgetGateDeltas[toId] * inputFromWeight;
    }
}