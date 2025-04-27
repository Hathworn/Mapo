#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate2_updateGradInput_kernel(
    float *gradInput, float *error, float* targetCentroids, 
    const float *centroids, const float *input, const float *inputIndice, 
    const float *outputIndice, const float* output, const float* gradOutput, 
    int inputSize, int outputSize, int inputWindowSize, int outputWindowSize, 
    int windowStride, float c, float d, float e, float lr)
{
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *gradOutput_k = gradOutput + outputWindowSize * k;
    float *gradInput_k = gradInput + inputSize * k;

    float *gradInputWindow = gradInput_k + static_cast<int>(inputIndice[k] - 1);

    // Use shared memory for partial sums
    __shared__ float sharedSum[256];

    float sum = 0;
    for (int i = tx; i < inputWindowSize; i += blockDim.x) {
        const float *gradOutputChannel = gradOutput_k + i * windowStride;
        for (int j = 0; j < windowStride; j++) {
            sum += gradOutputChannel[j];
        }
        sharedSum[tx] = sum;  // Store the result in shared memory

        __syncthreads();  // Ensure all threads have written their sums

        // Sum within the shared memory array
        if (tx == 0) {
            float blockSum = 0;
            for (int j = 0; j < blockDim.x; j++) {
                blockSum += sharedSum[j];
            }
            gradInputWindow[i] += blockSum;
        }
        
        __syncthreads();  // Ensure the first thread updates the memory
    }
}