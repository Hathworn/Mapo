#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate2_updateOutput_kernel(float *output, float *centroids, float *normalizedCentroids, float *inputIndice, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int inputWindowSize, int outputWindowSize, int windowStride, int train) {
    __shared__ float buffer[WINDOWGATE2_THREADS + 1]; // Shared memory buffer
    unsigned int tx = threadIdx.x;  // Thread index
    unsigned int k = blockIdx.x;    // Block index for batch processing
    const float *input_k = input + inputSize * k;  // Input segment for current batch
    float *output_k = output + outputWindowSize * k;  // Output segment for current batch

    // Initialize buffer to zero
    buffer[tx] = 0;
    // Calculate weighted sum of input indices multiplied by inputs
    for (unsigned int i = tx; i < inputSize; i += blockDim.x) {
        buffer[tx] += input_k[i] * (float)(i + 1);
    }

    // Perform parallel reduction within a block to accumulate the sum
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Single thread computes final centroid from reduction result
    if (tx == 0) {
        float centroid = buffer[0];
        centroid /= (float)(inputSize);  // Normalize centroid to range [0, 1]
        normalizedCentroids[k] = centroid;

        if (train) {
            centroid += noise[k];  // Add noise during training
            centroid = fminf(fmaxf(0, centroid), 1);  // Clamp to [0, 1]
        }
        centroid *= (float)(outputSize); // Scale centroid to output size

        float inputIdx = centroid / (float)(inputSize) - 0.5f * inputWindowSize;
        float outputIdx = centroid - 0.5f * outputWindowSize;

        // Clamp the input and output indices
        inputIdx = fminf(inputIdx, inputSize - inputWindowSize + 1);
        inputIdx = fmaxf(inputIdx, 1);
        outputIdx = fminf(outputIdx, outputSize - outputWindowSize + 1);
        outputIdx = fmaxf(outputIdx, 1);

        inputIdx = ceilf(inputIdx);  // Round up to nearest whole number
        outputIdx = ceilf(outputIdx); // Round up to nearest whole number

        // Adjust centroid relative to aligned outputWindow
        centroid -= (outputIdx - 1);

        inputIndice[k] = (int)inputIdx;
        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;

        buffer[WINDOWGATE2_THREADS] = inputIdx; // Store aligned input index
    }

    __syncthreads();

    float inputIdx = buffer[WINDOWGATE2_THREADS]; // Load aligned input index
    const float *inputWindow = input_k + (int)inputIdx; // Pointer to input window

    // Map input window to output window based on stride
    for (int i = tx; i < outputWindowSize; i += blockDim.x) {
        output_k[i] = inputWindow[(int)floorf((float)i / windowStride)];
    }
}