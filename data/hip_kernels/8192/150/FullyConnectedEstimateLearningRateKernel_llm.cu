```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FullyConnectedEstimateLearningRateKernel( float *weightLearningRatePtr, float *biasLearningRatePtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *avgWeightGradVarPtr, float *avgBiasGradVarPtr, float *avgWeightGradCurvePtr, float *avgBiasGradCurvePtr, float *avgWeightGradCurveVarPtr, float *avgBiasGradCurveVarPtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Calculate global thread index
    int j = blockDim.x * blockIdx.y * gridDim.x
            + blockDim.x * blockIdx.x
            + threadIdx.x;

    if (j >= thisLayerSize || dropoutMaskPtr[j])
        return;

    int index = j;
    for (int i = 0; i < prevLayerSize; i++)
    {
        // Calculate weight learning rate: precompute repeated terms
        float grad = avgWeightGradPtr[index];
        weightLearningRatePtr[index] = (avgWeightGradCurvePtr[index] / avgWeightGradCurveVarPtr[index]) * ((grad * grad) / avgWeightGradVarPtr[index]);
        index += thisLayerSize;
    }

    // Calculate bias learning rate: precompute repeated terms
    float biasGrad = avgBiasGradPtr[j];
    biasLearningRatePtr[j] = (avgBiasGradCurvePtr[j] / avgBiasGradCurveVarPtr[j]) * ((biasGrad * biasGrad) / avgBiasGradVarPtr[j]);
}