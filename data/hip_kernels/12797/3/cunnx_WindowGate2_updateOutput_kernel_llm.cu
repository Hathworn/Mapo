#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate2_updateOutput_kernel( float *output, float *centroids, float *normalizedCentroids, float *inputIndice, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int inputWindowSize, int outputWindowSize, int windowStride, int train)
{
    __shared__ float buffer[WINDOWGATE2_THREADS + 1];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize * k;
    float *output_k = output + outputWindowSize * k;

    // Initialize buffer
    float sum = 0;
    for (unsigned int i = tx; i < inputSize; i += blockDim.x)
        sum += input_k[i] * (float)(i + 1);
    
    buffer[tx] = sum;

    // Optimized reduction
    __syncthreads();
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tx < stride)
            buffer[tx] += buffer[tx + stride];
        __syncthreads();
    }

    if (tx == 0)
    {
        float centroid = buffer[0] / (float)inputSize;
        normalizedCentroids[k] = centroid;

        if (train)
        {
            centroid += noise[k];
            centroid = fminf(fmaxf(0, centroid), 1);
        }

        centroid *= (float)outputSize;

        float inputIdx = centroid / (float)inputSize - 0.5f * (float)inputWindowSize;
        float outputIdx = centroid - 0.5f * (float)outputWindowSize;

        inputIdx = fminf(fmaxf(1, inputIdx), inputSize - inputWindowSize + 1);
        outputIdx = fminf(fmaxf(1, outputIdx), outputSize - outputWindowSize + 1);

        inputIdx = ceilf(inputIdx);
        outputIdx = ceilf(outputIdx);

        centroid -= (outputIdx - 1);

        inputIndice[k] = (int)inputIdx;
        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;

        buffer[WINDOWGATE2_THREADS] = inputIdx;
    }

    __syncthreads();

    float inputIdx = buffer[WINDOWGATE2_THREADS];
    const float *inputWindow = input_k + (int)inputIdx;

    for (int i = tx; i < outputWindowSize; i += blockDim.x)
    {
        output_k[i] = inputWindow[(int)floorf(((float)i) / windowStride)];
    }
}