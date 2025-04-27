#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate_updateOutput_kernel(float *output, float *centroids, float *normalizedCentroids, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int outputWindowSize, float a, float b, int train)
{
    __shared__ float buffer[WINDOWGATE_THREADS];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize * k;
    float *output_k = output + outputWindowSize * k;

    // Initialize buffer for reduction
    buffer[tx] = 0.0f;

    // Compute sum of weighted indices
    for (unsigned int i = tx; i < inputSize; i += blockDim.x)
        buffer[tx] += input_k[i] * (float)(i + 1);

    // Perform reduction within thread block
    for (unsigned int stride = WINDOWGATE_THREADS >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
            buffer[tx] += buffer[tx + stride];
    }

    if (tx == 0)
    {
        float centroid = buffer[0];

        // Normalize centroid between 0 and 1
        centroid /= (float)inputSize;
        normalizedCentroids[k] = centroid;

        // Add noise and clamp centroid if training
        if (train)
        {
            centroid += noise[k];
            centroid = fminf(fmaxf(0.0f, centroid), 1.0f);
        }

        // Align centroid to output space
        centroid *= (float)outputSize;

        float outputIdx = centroid - 0.5f * (float)outputWindowSize;

        // Clip output index to valid range
        outputIdx = fminf(outputIdx, outputSize - outputWindowSize + 1);
        outputIdx = fmaxf(outputIdx, 1.0f);

        outputIdx = ceilf(outputIdx);

        // Align centroid to output window
        centroid -= (outputIdx - 1);

        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;
        buffer[0] = centroid;
    }

    __syncthreads();

    float centroid = buffer[0];

    // Apply Gaussian blur
    for (int i = tx; i < outputWindowSize; i += blockDim.x)
    {
        float x = (float)(i + 1) - centroid;
        output_k[i] = a * expf(x * x * b);
    }
}