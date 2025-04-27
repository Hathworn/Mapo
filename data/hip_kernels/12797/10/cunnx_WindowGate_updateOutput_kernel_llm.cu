#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_WindowGate_updateOutput_kernel( float *output, float *centroids, float *normalizedCentroids, float *outputIndice, const float *input, const float *noise, int inputSize, int outputSize, int outputWindowSize, float a, float b, int train)
{
    __shared__ float buffer[WINDOWGATE_THREADS];
    unsigned int tx = threadIdx.x;
    unsigned int k = blockIdx.x;
    const float *input_k = input + inputSize*k;
    float *output_k = output + outputWindowSize*k;

    // Initialize buffer to zero
    buffer[tx] = 0.0f;
    
    // Sum up the input values weighted by their indices
    for (unsigned int i = tx; i < inputSize; i += blockDim.x) {
        buffer[tx] += input_k[i] * (float)(i + 1);
    }

    // Block reduction to compute sum
    for (unsigned int stride = WINDOWGATE_THREADS >> 1; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Compute centroid and output index if thread index is 0
    if (tx == 0) {
        float centroid = buffer[0] / (float)inputSize;  // Normalize centroid
        normalizedCentroids[k] = centroid;

        if (train) {
            centroid += noise[k];
            centroid = fminf(fmaxf(0.0f, centroid), 1.0f);  // Clamp centroid
        }

        centroid *= (float)outputSize;  // Align centroid to output size

        // Calculate output index and ensure it's within valid bounds
        float outputIdx = centroid - 0.5f * (float)outputWindowSize;
        outputIdx = fminf(outputIdx, (float)(outputSize - outputWindowSize + 1));
        outputIdx = fmaxf(outputIdx, 1.0f);
        outputIdx = ceilf(outputIdx);  // Round up to nearest integer
        
        centroid -= (outputIdx - 1.0f);  // Align centroid to outputWindow
        outputIndice[k] = (int)outputIdx;
        centroids[k] = centroid;
        buffer[0] = centroid;
    }

    __syncthreads();
    
    float centroid = buffer[0];

    // Apply Gaussian blur
    for (int i = tx; i < outputWindowSize; i += blockDim.x) {
        float x = (float)(i + 1) - centroid;
        output_k[i] = a * expf(x * x * b);  // Compute output value
    }
}