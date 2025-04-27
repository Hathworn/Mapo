#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InputWeightsRTRLDerivativesKernel(float *input, float *hiddenActivationDerivatives, float *recurrentWeights, float *inputWeightRTRLDerivatives, float *previousInputWeightRTRLDerivatives)
{
    int partialId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                  + blockDim.x * blockIdx.x            // blocks preceding current block
                  + threadIdx.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int to = weightId / D_INPUT_UNITS;
        int from = weightId % D_INPUT_UNITS;

        // Use shared memory to reduce global memory access
        __shared__ float sharedRecurrentWeights[D_HIDDEN_UNITS];
        __shared__ float sharedPreviousDerivatives[D_HIDDEN_UNITS];
        
        float sum = 0;
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            // Load values into shared memory
            if (threadIdx.x < D_HIDDEN_UNITS)
            {
                sharedRecurrentWeights[threadIdx.x] = recurrentWeights[unitId * D_HIDDEN_UNITS + threadIdx.x];
                sharedPreviousDerivatives[threadIdx.x] = previousInputWeightRTRLDerivatives[threadIdx.x * (D_HIDDEN_UNITS * D_INPUT_UNITS) + weightId];
            }
            __syncthreads(); // Synchronize to ensure all threads have loaded their data

            sum += sharedRecurrentWeights[i] * sharedPreviousDerivatives[i];
        }

        inputWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to) * input[from] + sum);
    }
}