#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedUpdateMemoryKernel( float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Calculate the neuron index in the current layer
    int j = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    if (j < thisLayerSize && !dropoutMaskPtr[j]) // Dropout check and bounds check combined
    {
        int index = j;
        float avgWeightGrad, avgWeightGradVar, currentMemSize, updatedMemSize;

        for (int i = 0; i < prevLayerSize; i++)
        {
            // Load values and compute outside the memory access
            avgWeightGrad = avgWeightGradPtr[index];
            avgWeightGradVar = avgWeightGradVarPtr[index];
            currentMemSize = weightMemorySizePtr[index];

            // Update weight memory size
            updatedMemSize = (1.0f - avgWeightGrad * avgWeightGrad / avgWeightGradVar) * currentMemSize + 1.0f;
            weightMemorySizePtr[index] = updatedMemSize;

            index += thisLayerSize;
        }

        // Load values and compute outside the memory access for bias update
        float avgBiasGrad = avgBiasGradPtr[j];
        float avgBiasGradVar = avgBiasGradVarPtr[j];
        float currentBiasMemSize = biasMemorySizePtr[j];

        // Update bias memory size
        biasMemorySizePtr[j] = (1.0f - avgBiasGrad * avgBiasGrad / avgBiasGradVar) * currentBiasMemSize + 1.0f;
    }
}