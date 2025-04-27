#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedEstimateLearningRateKernel(float *weightLearningRatePtr, float *biasLearningRatePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize)
{
    int j = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Check if j is within bounds and not dropped out
    if (j < thisLayerSize && !dropoutMaskPtr[j])
    {
        float gradCurveVarInv = 1.0f / avgWeightGradCurveVarPtr[j];
        float gradVarInv = 1.0f / avgWeightGradVarPtr[j];
        float avgBiasGradCurve = avgBiasGradCurvePtr[j];
        float avgBiasGrad = avgBiasGradPtr[j];
        float avgBiasGradVar = avgBiasGradVarPtr[j];

        for (int i = 0, index = j; i < prevLayerSize; i++, index += thisLayerSize)
        {
            // Precompute invariant and save redundant calculations
            float weightGradCurve = avgWeightGradCurvePtr[index] * gradCurveVarInv;
            float weightGrad = avgWeightGradPtr[index] * gradVarInv;
            weightLearningRatePtr[index] = weightGradCurve * weightGrad * avgWeightGradPtr[index];
        }

        // Simplify bias learning rate computation
        biasLearningRatePtr[j] = (avgBiasGradCurve / avgBiasGradCurveVarPtr[j]) * (avgBiasGrad * avgBiasGrad / avgBiasGradVar);
    }
}