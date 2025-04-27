#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedAdjustMemoryKernel( float *weightsGradPtr, float *biasGradPtr, float *weightGradCurvePtr, float *biasGradCurvePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *weightMemorySizePtr, float *biasMemorySizePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Calculate j directly using linear index for better readability
    int j = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    if (j < thisLayerSize)
    {
        if (!dropoutMaskPtr[j])
        {
            int index = j;
            for (int i = 0; i < prevLayerSize; i++)
            {
                // Check for weight outliers: simplify through index reuse and reduce recalculations
                float weightGradDiff = weightsGradPtr[index] - avgWeightGradPtr[index];
                float weightGradCurveDiff = weightGradCurvePtr[index] - avgWeightGradCurvePtr[index];
                
                float weightGradVarSqrt = sqrtf(avgWeightGradVarPtr[index]);
                float weightGradCurveVarSqrt = sqrtf(avgWeightGradCurveVarPtr[index]);

                float weightVarianceTerm = weightGradVarSqrt - avgWeightGradPtr[index] * avgWeightGradPtr[index];
                float weightCurveVarianceTerm = weightGradCurveVarSqrt - avgWeightGradCurveVarPtr[index] * avgWeightGradCurveVarPtr[index];
                
                if (abs(weightGradDiff) > 2 * weightVarianceTerm || abs(weightGradCurveDiff) > 2 * weightCurveVarianceTerm)
                {
                    weightMemorySizePtr[index] = 2.2f;  // simplified; chosen Adasecant method
                }
                
                index += thisLayerSize;
            }

            // Check for bias outliers: reuse calculations similar to weight section
            float biasGradDiff = biasGradPtr[j] - avgBiasGradPtr[j];
            float biasGradCurveDiff = biasGradCurvePtr[j] - avgBiasGradCurvePtr[j];
            
            float biasGradVarSqrt = sqrtf(avgBiasGradVarPtr[j]);
            float biasGradCurveVarSqrt = sqrtf(avgBiasGradCurveVarPtr[j]);

            float biasVarianceTerm = biasGradVarSqrt - avgBiasGradPtr[j] * avgBiasGradPtr[j];
            float biasCurveVarianceTerm = biasGradCurveVarSqrt - avgBiasGradCurveVarPtr[j] * avgBiasGradCurveVarPtr[j];

            if (abs(biasGradDiff) > 2 * biasVarianceTerm || abs(biasGradCurveDiff) > 2 * biasCurveVarianceTerm)
            {
                biasMemorySizePtr[j] = 2.2f;  // simplified; chosen Adasecant method
            }
        }
    }
}