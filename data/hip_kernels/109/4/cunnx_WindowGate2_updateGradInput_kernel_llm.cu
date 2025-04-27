#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate2_updateGradInput_kernel( 
    float *gradInput, 
    float *error, 
    float *targetCentroids, 
    const float *centroids, 
    const float *input, 
    const float *inputIndice, 
    const float *outputIndice, 
    const float *output, 
    const float *gradOutput, 
    int inputSize, 
    int outputSize, 
    int inputWindowSize, 
    int outputWindowSize, 
    int windowStride, 
    float c, 
    float d, 
    float e, 
    float lr) 
{
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *gradOutput_k = gradOutput + outputWindowSize * k;
    float *gradInput_k = gradInput + inputSize * k;

    float *gradInputWindow = gradInput_k + (int)(inputIndice[k] - 1);

    // Optimize memory access by using shared memory
    __shared__ float sharedGradOutput[256]; // Adjust size as needed

    for (int i = tx; i < inputWindowSize; i += blockDim.x) 
    {
        float sum = 0;
        const float *gradOutputChannel = gradOutput_k + i * windowStride;
        
        // Copy gradOutputChannel to shared memory
        for (int j = 0; j < windowStride; j += blockDim.x) 
        {
            sharedGradOutput[j + tx] = gradOutputChannel[j + tx];
        }
        
        // Synchronize to ensure all threads have completed memory transfer
        __syncthreads();

        // Use shared memory for computation
        for (int j = 0; j < windowStride; j++) 
        {
            sum += sharedGradOutput[j];
        }

        gradInputWindow[i] += sum;

        // Synchronize to ensure memory consistency
        __syncthreads();
    }
}