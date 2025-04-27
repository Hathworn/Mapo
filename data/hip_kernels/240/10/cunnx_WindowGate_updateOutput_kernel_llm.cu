#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate_updateOutput_kernel(float *output, float *centroids, float *normalizedCentroids, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int outputWindowSize, float a, float b, int train)
{
    __shared__ float buffer[WINDOWGATE_THREADS];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize * k;
    float *output_k = output + outputWindowSize * k;

    // Initialize shared memory buffer to 0
    buffer[tx] = 0;

    // Calculate the weighted sum for centroid coordinate
    for (unsigned int i = tx; i < inputSize; i += blockDim.x)
        buffer[tx] += input_k[i] * (float)(i + 1);

    // Reduction to get single centroid value per block
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
            buffer[tx] += buffer[tx + stride];
    }

    if (tx == 0)
    {
        float centroid = buffer[0];
        centroid /= (float)(inputSize); // Normalize centroid
        normalizedCentroids[k] = centroid;
        
        if (train)
        {
            centroid += noise[k];
            centroid = fminf(fmaxf(0, centroid), 1);
        }
        centroid *= (float)(outputSize); // Align centroid

        float outputIdx = centroid - 0.5f * (float)outputWindowSize;
        outputIdx = fminf(fmaxf(outputIdx, 1), outputSize - outputWindowSize + 1);
        outputIdx = ceilf(outputIdx); // Calculate output index
        
        centroid -= (outputIdx - 1); // Adjust centroid position

        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;
        buffer[0] = centroid;
    }

    __syncthreads();
    float centroid = buffer[0];

    // Apply Gaussian blur to output window
    for (int i = tx; i < outputWindowSize; i += blockDim.x)
    {
        float x = (float)(i + 1) - centroid;
        output_k[i] = a * expf(x * x * b);
    }
}