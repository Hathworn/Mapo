#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeInputWeightsKernel(float *inputWeights, float *inputWeightDeltas, float *outputWeights, float *outputDeltas, float *inputWeightRTRLDerivatives, float trainingRate, float momentum)
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                 + blockDim.x * blockIdx.x             // blocks preceding current block
                 + threadIdx.x;

    if (weightId < D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        float gradient = 0.0f;

        // Use shared memory to store partial sums for faster access
        extern __shared__ float sharedSum[];
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            sharedSum[threadIdx.x] = 0.0f;
            for (int j = 0; j < D_HIDDEN_UNITS; j++)
            {
                sharedSum[threadIdx.x] += outputWeights[i * D_HIDDEN_UNITS + j] *
                                          inputWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_INPUT_UNITS + weightId];
            }
            __syncthreads(); // Ensure all threads complete the computation

            gradient += outputDeltas[i] * sharedSum[threadIdx.x];
            __syncthreads(); // Ensure all threads read updated gradient
        }

        float weightDelta = trainingRate * gradient + momentum * inputWeightDeltas[weightId];
        inputWeightDeltas[weightId] = weightDelta;
        inputWeights[weightId] += weightDelta;
    }
}