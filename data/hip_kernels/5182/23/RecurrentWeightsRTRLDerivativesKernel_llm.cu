#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RecurrentWeightsRTRLDerivativesKernel( float *previousHiddenActivations, float *hiddenActivationDerivatives, float *recurrentWeights, float *recurrentWeightRTRLDerivatives, float *previousRecurrentWeightRTRLDerivatives )
{
    int partialId = blockDim.x * blockIdx.y * gridDim.x	// Calculate the unique identifier for each thread
                     + blockDim.x * blockIdx.x
                     + threadIdx.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int to = weightId / D_HIDDEN_UNITS;
        int from = weightId % D_HIDDEN_UNITS;

        float sum = 0;
        // Use shared memory for inputs to improve cache hits
        __shared__ float sharedRecurrentWeights[D_HIDDEN_UNITS * D_HIDDEN_UNITS];
        __shared__ float sharedPreviousRTRLDerivatives[D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_HIDDEN_UNITS];
        
        // Load elements into shared memory
        if (threadIdx.x < D_HIDDEN_UNITS * D_HIDDEN_UNITS) {
            sharedRecurrentWeights[threadIdx.x] = recurrentWeights[threadIdx.x];
            sharedPreviousRTRLDerivatives[threadIdx.x] = previousRecurrentWeightRTRLDerivatives[threadIdx.x];
        }
        __syncthreads();

        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            sum += sharedRecurrentWeights[unitId * D_HIDDEN_UNITS + i] * sharedPreviousRTRLDerivatives[i * (D_HIDDEN_UNITS * D_HIDDEN_UNITS) + weightId];
        }

        recurrentWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to) * previousHiddenActivations[from] + sum);
    }
}