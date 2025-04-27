#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedUpdateMemoryKernel( float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    int j = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global thread index

    if (j < thisLayerSize && !dropoutMaskPtr[j]) // Check thread range and mask in a single condition
    {
        float avgBiasGrad = avgBiasGradPtr[j];
        float avgBiasGradVar = avgBiasGradVarPtr[j];
        float biasMemory = biasMemorySizePtr[j];

        for (int i = 0; i < prevLayerSize; i++)
        {
            int index = i * thisLayerSize + j; // Compute index once per inner loop

            // Cache reused values to avoid redundant memory accesses
            float avgWeightGrad = avgWeightGradPtr[index];
            float avgWeightGradVar = avgWeightGradVarPtr[index];

            // Update memory size with cached values
            weightMemorySizePtr[index] = (1.0f - avgWeightGrad * avgWeightGrad / avgWeightGradVar) * weightMemorySizePtr[index] + 1.0f;
        }

        // Update bias memory size with cached values
        biasMemorySizePtr[j] = (1.0f - avgBiasGrad * avgBiasGrad / avgBiasGradVar) * biasMemory + 1.0f;
    }
}