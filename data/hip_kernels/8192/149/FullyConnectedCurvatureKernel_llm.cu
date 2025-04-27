#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedCurvatureKernel( float *weightsGradPtr, float *biasGradPtr, float *shiftedWeightsPtr, float *shiftedBiasPtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *weightGradCurvePtr, float *biasGradCurvePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Precompute common indices and load once
    int j = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if (j < thisLayerSize)
    {
        if (!dropoutMaskPtr[j])
        {
            int index = j;
            float avgGradWeights, avgGradBias;

            for (int i = 0; i < prevLayerSize; i++)
            {
                // weight finite difference curvature
                avgGradWeights = avgWeightGradPtr[index];
                avgGradWeights = (avgGradWeights == 0) ? 0.000001f : avgGradWeights; // safe division
                weightGradCurvePtr[index] = fabsf(weightsGradPtr[index] - shiftedWeightsPtr[index]) / avgGradWeights;
                index += thisLayerSize;
            }

            // bias finite difference curvature
            avgGradBias = avgBiasGradPtr[j];
            avgGradBias = (avgGradBias == 0) ? 0.000001f : avgGradBias; // safe division
            biasGradCurvePtr[j] = fabsf(biasGradPtr[j] - shiftedBiasPtr[j]) / avgGradBias;
        }
    }
}
```
