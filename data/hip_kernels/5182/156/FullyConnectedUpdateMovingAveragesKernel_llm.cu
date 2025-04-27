#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedUpdateMovingAveragesKernel( float *weightsGradPtr, float *biasGradPtr, float *weightsGradCurvePtr, float *biasGradCurvePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    int j = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;

    if (j < thisLayerSize && !dropoutMaskPtr[j]) // Early exit if j is out of bounds or mask is active
    {
        float invWeightMemSize, invBiasMemSize;
        int index = j;

        invBiasMemSize = 1.0f / biasMemorySizePtr[j];
        
        for (int i = 0; i < prevLayerSize; i++)
        {
            invWeightMemSize = 1.0f / weightMemorySizePtr[index];

            // Update moving averages for weights
            float weightGrad = weightsGradPtr[index];
            float weightGradCurve = weightsGradCurvePtr[index];
            avgWeightGradPtr[index] = (1.0f - invWeightMemSize) * avgWeightGradPtr[index] + invWeightMemSize * weightGrad;
            avgWeightGradVarPtr[index] = (1.0f - invWeightMemSize) * avgWeightGradVarPtr[index] + invWeightMemSize * weightGrad * weightGrad;
            avgWeightGradCurvePtr[index] = (1.0f - invWeightMemSize) * avgWeightGradCurvePtr[index] + invWeightMemSize * weightGradCurve;
            avgWeightGradCurveVarPtr[index] = (1.0f - invWeightMemSize) * avgWeightGradCurveVarPtr[index] + invWeightMemSize * weightGradCurve * weightGradCurve;

            index += thisLayerSize; // Increment index for next curvature
        }

        float biasGrad = biasGradPtr[j];
        float biasGradCurve = biasGradCurvePtr[j];

        // Update moving averages for biases
        avgBiasGradPtr[j] = (1.0f - invBiasMemSize) * avgBiasGradPtr[j] + invBiasMemSize * biasGrad;
        avgBiasGradVarPtr[j] = (1.0f - invBiasMemSize) * avgBiasGradVarPtr[j] + invBiasMemSize * biasGrad * biasGrad;
        avgBiasGradCurvePtr[j] = (1.0f - invBiasMemSize) * avgBiasGradCurvePtr[j] + invBiasMemSize * biasGradCurve;
        avgBiasGradCurveVarPtr[j] = (1.0f - invBiasMemSize) * avgBiasGradCurveVarPtr[j] + invBiasMemSize * biasGradCurve * biasGradCurve;
    }
}