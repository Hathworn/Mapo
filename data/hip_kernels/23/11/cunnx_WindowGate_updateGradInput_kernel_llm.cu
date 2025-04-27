#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_WindowGate_updateGradInput_kernel( float *gradInput, float *error, float* targetCentroids, const float *centroids,const float *input, const float *outputIndice, const float* output, const float* gradOutput, int inputSize, int outputSize, int outputWindowSize, float c, float d, float e, float lr)
{
    __shared__ float buffer[WINDOWGATE_THREADS+1];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *gradOutput_k = gradOutput + outputWindowSize*k;
    const float *output_k = output + outputWindowSize*k;
    const float *input_k = input + inputSize*k;
    float *gradInput_k = gradInput + inputSize*k;
    float centroid = centroids[k];

    // Initialize shared memory for summation
    buffer[tx] = 0;
    float sum = 0;
    for (unsigned int i = tx; i < outputWindowSize; i += blockDim.x)
    {
        sum += gradOutput_k[i] * output_k[i] * ((float)(i + 1) - centroid);
    }
    buffer[tx] = sum;

    // Parallel reduction to sum over buffer
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    if (tx == 0)
    {
        int outputIdx = outputIndice[k];
        float gradCentroid = buffer[0] * c;
        centroid -= (lr * gradCentroid);
        centroid += outputIdx - 1;
        centroid /= (float)(outputSize);
        targetCentroids[k] = centroid;
        buffer[WINDOWGATE_THREADS] = centroid * (float)(inputSize);
    }

    __syncthreads();
    float targetCentroid = buffer[WINDOWGATE_THREADS];

    buffer[tx] = 0;
    // Compute target values and update gradInput
    for (int i = tx; i < inputSize; i += blockDim.x)
    {
        float target = (float)(i + 1) - targetCentroid;
        target = d * expf(target * target * e);
        float input = input_k[i];
        buffer[tx] -= logf(input + 1e-7f) * target;
        gradInput_k[i] = -target / (input + 1e-7f);
    }

    // Final reduction to compute error
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    if (tx == 0)
    {
        error[k] = buffer[tx];
    }
}