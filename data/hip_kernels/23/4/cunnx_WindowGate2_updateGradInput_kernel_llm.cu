#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_WindowGate2_updateGradInput_kernel(float *gradInput, float *error, float* targetCentroids, 
                                                         const float *centroids, const float *input, 
                                                         const float *inputIndice, const float *outputIndice, 
                                                         const float* output, const float* gradOutput, 
                                                         int inputSize, int outputSize, int inputWindowSize, 
                                                         int outputWindowSize, int windowStride, float c, 
                                                         float d, float e, float lr) {
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *gradOutput_k = gradOutput + outputWindowSize * k;
    float *gradInput_k = gradInput + inputSize * k;

    float *gradInputWindow = gradInput_k + (int)(inputIndice[k] - 1);

    // Use the shared memory to optimize global memory access
    extern __shared__ float sharedGradOutputChannel[];
    
    for (int i = tx; i < inputWindowSize; i += blockDim.x) {
        float sum = 0;

        // Load gradOutputChannel into shared memory in chunks
        for (int j = threadIdx.x; j < windowStride; j+=blockDim.x) {
            sharedGradOutputChannel[j] = gradOutput_k[i * windowStride + j];
        }
        __syncthreads();

        // Sum over shared memory to reduce global memory access
        for (int j = 0; j < windowStride; j++) {
            sum += sharedGradOutputChannel[j];
        }

        gradInputWindow[i] += sum;
    }
}