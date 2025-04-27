#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InputWeightsRTRLDerivativesKernel(float *input, float *hiddenActivationDerivatives, float *recurrentWeights, float *inputWeightRTRLDerivatives, float *previousInputWeightRTRLDerivatives)
{
    int partialId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                  + blockDim.x * blockIdx.x             // blocks preceding current block
                  + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float sharedRecurrentWeights[D_HIDDEN_UNITS];
    __shared__ float sharedPreviousRTRLDerivatives[D_HIDDEN_UNITS];

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int to = weightId / D_INPUT_UNITS;
        int from = weightId % D_INPUT_UNITS;

        float sum = 0;

        // Load data to shared memory
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            sharedRecurrentWeights[i] = recurrentWeights[unitId * D_HIDDEN_UNITS + i];
            sharedPreviousRTRLDerivatives[i] = previousInputWeightRTRLDerivatives[i * (D_HIDDEN_UNITS * D_INPUT_UNITS) + weightId];
            __syncthreads(); // Synchronize threads to ensure all data is loaded
            
            sum += sharedRecurrentWeights[i] * sharedPreviousRTRLDerivatives[i];
            
            __syncthreads(); // Synchronize threads before next iteration
        }

        inputWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to) * input[from] + sum);
    }
}