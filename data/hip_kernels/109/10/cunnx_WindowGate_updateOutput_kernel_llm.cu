#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_WindowGate_updateOutput_kernel(float *output, float *centroids, float *normalizedCentroids, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int outputWindowSize, float a, float b, int train)
{
    __shared__ float buffer[WINDOWGATE_THREADS];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize * k;
    float *output_k = output + outputWindowSize * k;

    // Initialize shared memory buffer
    buffer[tx] = 0.0f;

    // Parallel reduction to compute centroid
    for (unsigned int i = tx; i < inputSize; i += blockDim.x)
    {
        buffer[tx] += input_k[i] * static_cast<float>(i + 1);
    }

    // Synchronize threads and perform reduction
    __syncthreads();
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads();
    }

    // Calculate centroid and process it
    float centroid;
    if (tx == 0)
    {
        centroid = buffer[0] / static_cast<float>(inputSize);
        normalizedCentroids[k] = centroid;
        if (train)
        {
            centroid += noise[k];
            centroid = fminf(fmaxf(centroid, 0.0f), 1.0f);
        }
        centroid *= static_cast<float>(outputSize);

        float outputIdx = centroid - 0.5f * static_cast<float>(outputWindowSize);
        outputIdx = fminf(fmaxf(1.0f, outputIdx), outputSize - outputWindowSize + 1);
        outputIdx = ceilf(outputIdx);
        centroid -= (outputIdx - 1);

        outputIndice[k] = static_cast<int>(outputIdx);
        centroids[k] = centroid;
        buffer[0] = centroid;
    }
    
    __syncthreads();

    // Gaussian blur calculation
    centroid = buffer[0];
    for (int i = tx; i < outputWindowSize; i += blockDim.x)
    {
        float x = static_cast<float>(i + 1) - centroid;
        output_k[i] = a * expf(x * x * b);
    }
}