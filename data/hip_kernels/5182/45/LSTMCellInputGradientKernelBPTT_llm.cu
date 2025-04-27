#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LSTMCellInputGradientKernelBPTT(float *input, float *previousOutput, float *cellInputDeltas, float *cellInputWeightGradient, int inputCount, int previousOutputCount, int cellsPerBlock) 
{
    int weightId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Simplified weightId computation
    
    int weightsPerCell = inputCount + previousOutputCount + 1; // Per cell weight count

    if (weightId < weightsPerCell * previousOutputCount) 
    {
        int fromId = weightId % weightsPerCell;
        int toId = weightId / weightsPerCell;

        float inputFromWeight = 0.0f; // Initialize inputFromWeight
        
        // Conditional assignment
        if (fromId < inputCount) 
        {
            inputFromWeight = input[fromId];
        } 
        else if (fromId < inputCount + previousOutputCount) 
        {
            inputFromWeight = previousOutput[fromId - inputCount];
        } 
        else 
        {
            inputFromWeight = 1.0f; // Bias unit
        }
        
        // Direct calculation without branching
        cellInputWeightGradient[weightId] = cellInputDeltas[toId] * inputFromWeight;
    }
}