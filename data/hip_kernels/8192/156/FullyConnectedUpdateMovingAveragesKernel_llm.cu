#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedUpdateMovingAveragesKernel( float *weightsGradPtr, float *biasGradPtr, float *weightsGradCurvePtr, float *biasGradCurvePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Calculate j based on thread location
    int j = threadIdx.x + blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x);

    if (j < thisLayerSize && !dropoutMaskPtr[j])
    {
        // Compute index for weight operations
        int index = j;
        
        for (int i = 0; i < prevLayerSize; i++, index += thisLayerSize)
        {
            float weightMemoryInv = 1.0f / weightMemorySizePtr[index];
            float weightAvgFactor = 1.0f - weightMemoryInv;

            // Update moving averages for weights
            avgWeightGradPtr[index] = weightAvgFactor * avgWeightGradPtr[index] + weightMemoryInv * weightsGradPtr[index];
            avgWeightGradVarPtr[index] = weightAvgFactor * avgWeightGradVarPtr[index] + weightMemoryInv * weightsGradPtr[index] * weightsGradPtr[index];
            avgWeightGradCurvePtr[index] = weightAvgFactor * avgWeightGradCurvePtr[index] + weightMemoryInv * weightsGradCurvePtr[index];
            avgWeightGradCurveVarPtr[index] = weightAvgFactor * avgWeightGradCurveVarPtr[index] + weightMemoryInv * weightsGradCurvePtr[index] * weightsGradCurvePtr[index];
        }

        float biasMemoryInv = 1.0f / biasMemorySizePtr[j];
        float biasAvgFactor = 1.0f - biasMemoryInv;

        // Update moving averages for biases
        avgBiasGradPtr[j] = biasAvgFactor * avgBiasGradPtr[j] + biasMemoryInv * biasGradPtr[j];
        avgBiasGradVarPtr[j] = biasAvgFactor * avgBiasGradVarPtr[j] + biasMemoryInv * biasGradPtr[j] * biasGradPtr[j];
        avgBiasGradCurvePtr[j] = biasAvgFactor * avgBiasGradCurvePtr[j] + biasMemoryInv * biasGradCurvePtr[j];
        avgBiasGradCurveVarPtr[j] = biasAvgFactor * avgBiasGradCurveVarPtr[j] + biasMemoryInv * biasGradCurvePtr[j] * biasGradCurvePtr[j];
    }
}