#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_WindowGate2_updateOutput_kernel( float *output, float *centroids, float *normalizedCentroids, float *inputIndice, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int inputWindowSize, int outputWindowSize, int windowStride, int train)
{
    __shared__ float buffer[WINDOWGATE2_THREADS+1];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize*k;
    float *output_k = output + outputWindowSize*k;

    // Initialize shared memory
    buffer[tx] = 0.0f;
    __syncthreads();

    // Load input and compute the weighted sum
    float partialSum = 0.0f;
    for (unsigned int i = tx; i < inputSize; i += blockDim.x) {
        partialSum += input_k[i] * (float)(i + 1);
    }
    buffer[tx] = partialSum;
    __syncthreads();

    // Reduce using binary tree in shared memory
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads();
    }

    if (tx == 0) {
        float centroid = buffer[0];

        // Normalize centroid between 0 and 1
        centroid /= (float)(inputSize);
        normalizedCentroids[k] = centroid;
        if (train) {
            centroid += noise[k];
            centroid = fminf(fmaxf(0.0f, centroid), 1.0f);
        }

        // Align centroids to output
        centroid *= (float)(outputSize);

        // Calculate and clip indices
        float inputIdx = centroid / (float)(inputSize) - 0.5f * (float)inputWindowSize;
        float outputIdx = centroid - 0.5f * (float)outputWindowSize;
        inputIdx = fminf(inputIdx, (float)(inputSize - inputWindowSize + 1));
        inputIdx = fmaxf(inputIdx, 1.0f);
        outputIdx = fminf(outputIdx, (float)(outputSize - outputWindowSize + 1));
        outputIdx = fmaxf(outputIdx, 1.0f);

        // Align centroid to output window
        inputIdx = ceilf(inputIdx);
        outputIdx = ceilf(outputIdx);
        centroid -= (outputIdx - 1.0f);

        // Store inputs and outputs indices
        inputIndice[k] = (int)inputIdx;
        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;

        // Store input index for later use
        buffer[WINDOWGATE2_THREADS] = inputIdx;
    }

    __syncthreads();

    // Load input window using calculated input index
    float inputIdx = buffer[WINDOWGATE2_THREADS];
    const float *inputWindow = input_k + (int)inputIdx;

    // Copy data to output window
    for (int i = tx; i < outputWindowSize; i += blockDim.x) {
        output_k[i] = inputWindow[(int)(floorf((float)i / windowStride))];
    }
}