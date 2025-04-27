#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RecurrentWeightsRTRLDerivativesKernel(float *previousHiddenActivations, float *hiddenActivationDerivatives, float *recurrentWeights, float *recurrentWeightRTRLDerivatives, float *previousRecurrentWeightRTRLDerivatives)
{
    int partialId = blockDim.x * blockIdx.y * gridDim.x // Calculate unique thread ID
                   + blockDim.x * blockIdx.x
                   + threadIdx.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int to = weightId / D_HIDDEN_UNITS;
        int from = weightId % D_HIDDEN_UNITS;

        // Use shared memory for partial sums to improve memory access speed
        extern __shared__ float sharedMem[];
        
        float *sumShared = sharedMem;
        
        float sum = 0.0f;
        for (int i = threadIdx.x; i < D_HIDDEN_UNITS; i += blockDim.x)
        {
            sum += recurrentWeights[unitId * D_HIDDEN_UNITS + i] * previousRecurrentWeightRTRLDerivatives[i * (D_HIDDEN_UNITS * D_HIDDEN_UNITS) + weightId];
        }

        sumShared[threadIdx.x] = sum;
        __syncthreads();

        // Perform reduction on shared memory
        if (threadIdx.x == 0)
        {
            float blockSum = 0.0f;
            for (int i = 0; i < blockDim.x; i++)
            {
                blockSum += sumShared[i];
            }
            recurrentWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to) * previousHiddenActivations[from] + blockSum);
        }
    }
}