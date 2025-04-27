#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedShiftKernel(float *weightPtr, float *biasPtr, float *shiftedWeightsPtr, float *shiftedBiasPtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize)
{
    int j = blockDim.x * blockIdx.y * gridDim.x  // Calculate global thread index
            + blockDim.x * blockIdx.x 
            + threadIdx.x;

    if (j < thisLayerSize && !dropoutMaskPtr[j]) // Check boundary and dropout condition
    {
        int index = j;
        for (int i = 0; i < prevLayerSize; i++) // Optimize loop by removing i declaration outside
        {
            shiftedWeightsPtr[index] = weightPtr[index] + avgWeightGradPtr[index]; // Update weight gradient
            index += thisLayerSize;
        }

        shiftedBiasPtr[j] = biasPtr[j] - avgBiasGradPtr[j]; // Update bias gradient
    }
}