#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedShiftKernel(float *weightPtr, float *biasPtr, float *shiftedWeightsPtr, float *shiftedBiasPtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize)
{
    // j: current layer neuron id
    int j = blockDim.x * blockIdx.y * gridDim.x  // rows preceding current row in grid
            + blockDim.x * blockIdx.x            // blocks preceding current block
            + threadIdx.x;

    if (j < thisLayerSize)
    {
        if (!dropoutMaskPtr[j])
        {
            // Use shared memory for better performance
            extern __shared__ float sharedMem[];
            float *sharedWeights = sharedMem;
            float *sharedBias = (float*)&sharedWeights[prevLayerSize];

            for (int i = 0; i < prevLayerSize; i++)
            {
                // Load to shared memory
                sharedWeights[i] = weightPtr[i * thisLayerSize + j];
            }
            sharedBias[j] = biasPtr[j];

            __syncthreads();

            // weight gradient
            int index = j;
            for (int i = 0; i < prevLayerSize; i++)
            {
                shiftedWeightsPtr[index] = sharedWeights[i] + avgWeightGradPtr[index];
                index += thisLayerSize;
            }

            // bias gradient
            shiftedBiasPtr[j] = sharedBias[j] - avgBiasGradPtr[j]; 
        }
    }
}