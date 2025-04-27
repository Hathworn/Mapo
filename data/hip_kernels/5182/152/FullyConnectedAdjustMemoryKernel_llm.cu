#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedAdjustMemoryKernel( float *weightsGradPtr, float *biasGradPtr, float *weightGradCurvePtr, float *biasGradCurvePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    int j = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;

    if (j < thisLayerSize && !dropoutMaskPtr[j])
    {
        int index = j;
        
        float avgWeightGrad = avgWeightGradPtr[index];
        float avgWeightGradVar = avgWeightGradVarPtr[index];
        float avgWeightGradCurve = avgWeightGradCurvePtr[index];
        float avgWeightGradCurveVar = avgWeightGradCurveVarPtr[index];

        float weightThreshold = 2 * sqrtf(avgWeightGradVar) - avgWeightGrad * avgWeightGrad;
        float weightCurveThreshold = 2 * sqrtf(avgWeightGradCurveVar - avgWeightGradCurveVar * avgWeightGradCurveVar);

        for (int i = 0; i < prevLayerSize; i++)
        {
            // Use pre-calculated threshold for efficiency
            if (abs(weightsGradPtr[index] - avgWeightGrad) > weightThreshold ||
                abs(weightGradCurvePtr[index] - avgWeightGradCurve) > weightCurveThreshold)
            {
                weightMemorySizePtr[index] = 2.2f;
            }
            index += thisLayerSize;
        }

        float avgBiasGrad = avgBiasGradPtr[j];
        float avgBiasGradVar = avgBiasGradVarPtr[j];
        float avgBiasGradCurve = avgBiasGradCurvePtr[j];
        float avgBiasGradCurveVar = avgBiasGradCurveVarPtr[j];

        float biasThreshold = 2 * sqrtf(avgBiasGradVar) - avgBiasGrad * avgBiasGrad;
        float biasCurveThreshold = 2 * sqrtf(avgBiasGradCurveVar - avgBiasGradCurveVar * avgBiasGradCurveVar);

        // Use pre-calculated threshold for efficiency
        if (abs(biasGradPtr[j] - avgBiasGrad) > biasThreshold ||
            abs(biasGradCurvePtr[j] - avgBiasGradCurve) > biasCurveThreshold)
        {
            biasMemorySizePtr[j] = 2.2f;
        }
    }
}