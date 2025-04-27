#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activationProbability(float x, float sigma) {
    return 1.0 / (1.0 + expf(-sigma * x));
}

// Optimized RBMForwardKernel
__global__ void RBMForwardKernel(float *inputPtr, float *outputPtr, float *weightPtr, float *biasPtr, float sigma, int prevLayerSize, int thisLayerSize, bool useDropoutMask, bool useDropout, float dropoutRate, float *dropoutMask) {
    int j = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x; // Calculate the index j

    if (j < thisLayerSize) {
        if (useDropout && useDropoutMask && !dropoutMask[j]) {
            outputPtr[j] = 0; // Set output to 0 if dropout is applied
        } else {
            float sum = biasPtr[j]; // Start sum with bias
            int index = j;

            for (int i = 0; i < prevLayerSize; ++i) {
                sum += weightPtr[index] * inputPtr[i];
                index += thisLayerSize;
            }

            float result = activationProbability(sum, sigma);

            // Adjust result when dropout is used without mask
            if (useDropout && !useDropoutMask && dropoutRate < 1) {
                result /= dropoutRate;
            }

            outputPtr[j] = result; // Assign computed result to output
        }
    }
}